# VOICE NEWSPAPER DATABASE TABLE DESIGN DOCUMENTATION

**System:** Voice Newspaper Web Scraping System for Visually Impaired  
**Database:** voice_newspaper_db  
**Creation Date:** 2026-03-12  
**Version:** 1.0

---

## TABLE STRUCTURE OVERVIEW

### 1. LANGUAGE TABLE
**Purpose:** Store supported language information  
**Type:** Master/Reference Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| language_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique language identifier |
| language_code | VARCHAR(5) | NOT NULL, UNIQUE | ISO language code (en, hi, ta, ml) |
| language_name | VARCHAR(50) | NOT NULL | Full language name |
| locale | VARCHAR(10) | - | Locale string (e.g., en_US, hi_IN) |
| is_active | BOOLEAN | DEFAULT TRUE | Flag for active languages |
| created_at | TIMESTAMP | DEFAULT NOW() | Record creation timestamp |

**Indexes:** language_code (UNIQUE)  
**Sample Data:**
```
en, English, en_US
hi, Hindi, hi_IN
ta, Tamil, ta_IN
ml, Malayalam, ml_IN
```

---

### 2. USERS TABLE
**Purpose:** Store user information and accessibility profiles  
**Type:** Core Entity Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| user_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique user identifier |
| username | VARCHAR(100) | NOT NULL, UNIQUE | User login name |
| email | VARCHAR(120) | NOT NULL, UNIQUE | User email address |
| password_hash | VARCHAR(255) | - | Hashed password |
| accessibility_profile | VARCHAR(50) | - | Profile type (blind, low_vision) |
| device_type | VARCHAR(50) | - | Device used (desktop, mobile, tablet) |
| preferred_language_id | INT | FK→LANGUAGE | User's preferred language |
| account_status | VARCHAR(20) | DEFAULT 'active' | Account status (active, inactive, suspended) |
| created_at | TIMESTAMP | DEFAULT NOW() | Account creation date |
| last_login | TIMESTAMP | - | Last login timestamp |

**Indexes:** idx_email, idx_username  
**Foreign Keys:** preferred_language_id → LANGUAGE(language_id)

---

### 3. PREFERENCES TABLE
**Purpose:** Store user settings and preferences  
**Type:** Configuration Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| preference_id | INT | PRIMARY KEY, AUTO_INCREMENT | Preference record ID |
| user_id | INT | NOT NULL, UNIQUE, FK | User reference |
| language_id | INT | FK | Preferred language for content |
| auto_play | BOOLEAN | DEFAULT TRUE | Auto-play audio content |
| voice_speed | VARCHAR(20) | DEFAULT 'normal' | Speech speed (slow, normal, fast) |
| audio_format | VARCHAR(20) | DEFAULT 'mp3' | Preferred audio format |
| font_size | INT | DEFAULT 14 | UI font size |
| theme | VARCHAR(20) | DEFAULT 'light' | UI theme (light, dark) |
| notifications_enabled | BOOLEAN | DEFAULT TRUE | Notification preference |
| updated_at | TIMESTAMP | DEFAULT NOW() ON UPDATE | Last update time |

**Foreign Keys:** user_id → USERS(user_id), language_id → LANGUAGE(language_id)

---

### 4. SCRAPING_SESSIONS TABLE
**Purpose:** Track web scraping activities and sessions  
**Type:** Transactional Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| session_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique session ID |
| user_id | INT | NOT NULL, FK | User performing scraping |
| url_input | VARCHAR(500) | NOT NULL | Scraped URL |
| session_status | VARCHAR(20) | - | Status (pending, running, completed, failed) |
| session_start | TIMESTAMP | DEFAULT NOW() | Session start time |
| session_end | TIMESTAMP | - | Session end time |
| duration_seconds | INT | - | Total session duration |
| articles_scraped | INT | DEFAULT 0 | Number of articles scraped |
| error_message | TEXT | - | Error details if any |

**Indexes:** idx_user, idx_status, idx_created  
**Foreign Keys:** user_id → USERS(user_id)

---

### 5. ARTICLES TABLE
**Purpose:** Store scraped article content  
**Type:** Core Data Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| article_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique article ID |
| session_id | INT | NOT NULL, FK | Associated scraping session |
| title | VARCHAR(500) | NOT NULL | Article title |
| content | LONGTEXT | NOT NULL | Full article content |
| publish_date | TIMESTAMP | - | Article publication date |
| source_url | VARCHAR(500) | - | Original article URL |
| word_count | INT | - | Number of words in article |
| scrape_date | TIMESTAMP | DEFAULT NOW() | When article was scraped |
| is_processed | BOOLEAN | DEFAULT FALSE | Processing status flag |

**Indexes:** idx_session, idx_title (FULLTEXT), ft_content (FULLTEXT)  
**Foreign Keys:** session_id → SCRAPING_SESSIONS(session_id)

---

### 6. AUTHORS TABLE
**Purpose:** Store article author information  
**Type:** Detail Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| author_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique author record ID |
| article_id | INT | NOT NULL, FK | Associated article |
| author_name | VARCHAR(200) | - | Author's name |
| author_email | VARCHAR(120) | - | Author's email (if available) |

**Indexes:** idx_article  
**Foreign Keys:** article_id → ARTICLES(article_id)

---

### 7. HTML_OUTPUT TABLE
**Purpose:** Track generated HTML files  
**Type:** Output Tracking Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| html_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique HTML file ID |
| article_id | INT | NOT NULL, FK | Associated article |
| html_filename | VARCHAR(255) | - | Generated HTML filename |
| html_path | VARCHAR(500) | - | File storage path |
| template_used | VARCHAR(50) | - | Template name used |
| file_size | INT | - | HTML file size in bytes |
| generated_at | TIMESTAMP | DEFAULT NOW() | Generation timestamp |

**Indexes:** idx_article  
**Foreign Keys:** article_id → ARTICLES(article_id)

---

### 8. AUDIO_FILES TABLE
**Purpose:** Store converted audio file information  
**Type:** Media Assets Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| audio_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique audio file ID |
| article_id | INT | NOT NULL, FK | Associated article |
| language_id | INT | FK | Audio language |
| audio_filename | VARCHAR(255) | NOT NULL | Audio filename |
| audio_duration | VARCHAR(20) | - | Duration (HH:MM:SS) |
| format | VARCHAR(20) | DEFAULT 'mp3' | Audio format |
| file_path | VARCHAR(500) | - | Storage path |
| file_size | INT | - | File size in bytes |
| conversion_engine | VARCHAR(50) | - | Engine used (gTTS, pyttsx3) |
| generated_at | TIMESTAMP | DEFAULT NOW() | Generation time |

**Indexes:** idx_article, idx_language  
**Foreign Keys:** article_id → ARTICLES(article_id), language_id → LANGUAGE(language_id)

---

### 9. PLAYBACK_LOGS TABLE
**Purpose:** Track audio playback history and usage  
**Type:** Event Logging Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| log_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique log ID |
| audio_id | INT | NOT NULL, FK | Audio file played |
| user_id | INT | NOT NULL, FK | User who played |
| playback_start | TIMESTAMP | DEFAULT NOW() | Playback start time |
| playback_end | TIMESTAMP | - | Playback end time |
| duration_played | VARCHAR(20) | - | Duration played |
| device | VARCHAR(100) | - | Device used (speaker, headphone) |

**Indexes:** idx_audio, idx_user, idx_date  
**Foreign Keys:** audio_id → AUDIO_FILES(audio_id), user_id → USERS(user_id)

---

### 10. ACCESS_LOGS TABLE
**Purpose:** Track HTML content access  
**Type:** Audit Logging Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| access_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique access log ID |
| html_id | INT | NOT NULL, FK | Accessed HTML file |
| user_id | INT | FK | User accessing content |
| accessed_at | TIMESTAMP | DEFAULT NOW() | Access timestamp |
| browser_type | VARCHAR(100) | - | Browser information |
| ip_address | VARCHAR(50) | - | Client IP address |

**Indexes:** idx_html, idx_user, idx_accessed  
**Foreign Keys:** html_id → HTML_OUTPUT(html_id), user_id → USERS(user_id)

---

### 11. PDF_UPLOADS TABLE
**Purpose:** Store uploaded PDF files metadata  
**Type:** File Upload Tracking Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| pdf_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique PDF upload ID |
| user_id | INT | NOT NULL, FK | User who uploaded |
| pdf_filename | VARCHAR(255) | - | Original filename |
| pdf_path | VARCHAR(500) | - | Storage path |
| uploaded_at | TIMESTAMP | DEFAULT NOW() | Upload timestamp |
| file_size | INT | - | File size in bytes |
| total_pages | INT | - | Number of pages |

**Indexes:** idx_user  
**Foreign Keys:** user_id → USERS(user_id)

---

### 12. EXTRACTED_TEXT TABLE
**Purpose:** Store text extracted from PDF pages  
**Type:** Content Extraction Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| extract_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique extraction ID |
| pdf_id | INT | NOT NULL, FK | Source PDF |
| page_number | INT | - | Page number in PDF |
| extracted_text | LONGTEXT | - | Extracted text content |
| extraction_date | TIMESTAMP | DEFAULT NOW() | Extraction timestamp |

**Indexes:** idx_pdf  
**Foreign Keys:** pdf_id → PDF_UPLOADS(pdf_id)

---

### 13. SPEECH_INPUTS TABLE
**Purpose:** Store recorded audio input from users  
**Type:** Voice Input Tracking Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| speech_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique speech recording ID |
| user_id | INT | NOT NULL, FK | User who recorded |
| audio_filename | VARCHAR(255) | - | Recording filename |
| audio_path | VARCHAR(500) | - | Storage path |
| recorded_at | TIMESTAMP | DEFAULT NOW() | Recording timestamp |
| quality_rating | VARCHAR(20) | - | Audio quality rating |
| duration_seconds | INT | - | Recording duration |
| language_id | INT | FK | Language of speech |

**Indexes:** idx_user  
**Foreign Keys:** user_id → USERS(user_id), language_id → LANGUAGE(language_id)

---

### 14. RECOGNIZED_TEXT TABLE
**Purpose:** Store text recognized from speech input  
**Type:** Speech Recognition Results Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| text_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique recognition ID |
| speech_id | INT | NOT NULL, FK | Source speech recording |
| recognized_text | LONGTEXT | - | Recognized text result |
| confidence_score | FLOAT | - | Recognition confidence (0-1) |
| recognized_at | TIMESTAMP | DEFAULT NOW() | Recognition timestamp |

**Indexes:** idx_speech  
**Foreign Keys:** speech_id → SPEECH_INPUTS(speech_id)

---

### 15. ERROR_LOGS TABLE
**Purpose:** Track system errors and exceptions  
**Type:** System Logging Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| error_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique error log ID |
| user_id | INT | FK | User affected by error |
| session_id | INT | FK | Associated session |
| error_code | VARCHAR(50) | - | Error code identifier |
| error_message | TEXT | - | Error description |
| error_stack_trace | TEXT | - | Full stack trace |
| error_timestamp | TIMESTAMP | DEFAULT NOW() | Error occurrence time |
| severity | VARCHAR(20) | - | Severity level (low, medium, high, critical) |
| resolution | VARCHAR(255) | - | Resolution applied |

**Indexes:** idx_timestamp, idx_user  
**Foreign Keys:** user_id → USERS(user_id), session_id → SCRAPING_SESSIONS(session_id)

---

### 16. SYSTEM_STATS TABLE
**Purpose:** Store aggregated system statistics  
**Type:** Analytics Table

| Column Name | Data Type | Constraint | Description |
|---|---|---|---|
| stat_id | INT | PRIMARY KEY, AUTO_INCREMENT | Unique stat record ID |
| stat_date | DATE | - | Date of statistics |
| total_sessions | INT | DEFAULT 0 | Total scraping sessions |
| total_articles_scraped | INT | DEFAULT 0 | Total articles processed |
| total_audio_files_generated | INT | DEFAULT 0 | Total audio files created |
| total_users_active | INT | DEFAULT 0 | Active users count |
| avg_session_duration | INT | DEFAULT 0 | Average session duration |
| total_storage_used | INT | DEFAULT 0 | Total storage in bytes |
| last_updated | TIMESTAMP | DEFAULT NOW() | Last update time |

**Indexes:** idx_date

---

## DATABASE STATISTICS & INDEXES

### Summary of Tables
| Table Name | Record Type | Primary Purpose | Estimated Rows/Year |
|---|---|---|---|
| LANGUAGE | Master | Language support | 4 |
| USERS | Core | User management | 1,000-5,000 |
| PREFERENCES | Config | User settings | 1,000-5,000 |
| SCRAPING_SESSIONS | Transactional | Session tracking | 50,000-100,000 |
| ARTICLES | Core Data | Content storage | 500,000-1,000,000 |
| AUTHORS | Detail | Author tracking | 500,000+ |
| HTML_OUTPUT | Output | HTML tracking | 500,000+ |
| AUDIO_FILES | Media Assets | Audio storage metadata | 2,000,000+ |
| PLAYBACK_LOGS | Event Logging | Usage analytics | 10,000,000+ |
| ACCESS_LOGS | Audit Logging | Access tracking | 5,000,000+ |
| PDF_UPLOADS | File Upload | PDF tracking | 100,000+ |
| EXTRACTED_TEXT | Content | PDF extraction | 1,000,000+ |
| SPEECH_INPUTS | Voice Input | Voice recording | 100,000+ |
| RECOGNIZED_TEXT | SR Results | Speech recognition | 100,000+ |
| ERROR_LOGS | System | Error tracking | 100,000+ |
| SYSTEM_STATS | Analytics | System statistics | 365 |

---

## KEY CONSTRAINTS & RELATIONSHIPS

### Primary Key Strategy
- AUTO_INCREMENT for all primary keys
- Start value: 1 for each table

### Foreign Key Relationships
```
USERS ──┬─→ LANGUAGE
        ├─→ SCRAPING_SESSIONS
        ├─→ PREFERENCES
        ├─→ PDF_UPLOADS
        ├─→ SPEECH_INPUTS
        └─→ PLAYBACK_LOGS

SCRAPING_SESSIONS ──→ ARTICLES

ARTICLES ──┬─→ AUTHORS
           ├─→ AUDIO_FILES
           └─→ HTML_OUTPUT

AUDIO_FILES ──┬─→ LANGUAGE
              └─→ PLAYBACK_LOGS

HTML_OUTPUT ──→ ACCESS_LOGS

PDF_UPLOADS ──→ EXTRACTED_TEXT

SPEECH_INPUTS ──→ RECOGNIZED_TEXT
```

---

## DATABASE VIEWS (Pre-defined Queries)

### View 1: user_session_summary
Provides summary of user activity
```sql
SELECT 
    username, 
    total_sessions, 
    total_articles, 
    last_session,
    total_words_processed
FROM user_session_summary
```

### View 2: audio_generation_stats
Provides audio generation statistics by language
```sql
SELECT 
    language_name, 
    total_audio_files, 
    total_storage,
    conversion_engine
FROM audio_generation_stats
```

---

## INDEXING STRATEGY

### Composite Indexes
```sql
-- For optimal query performance
ALTER TABLE ARTICLES ADD INDEX idx_session_processed (session_id, is_processed);
ALTER TABLE AUDIO_FILES ADD INDEX idx_article_language (article_id, language_id);
ALTER TABLE PLAYBACK_LOGS ADD INDEX idx_user_date (user_id, playback_start);
```

### Full-Text Indexes
```sql
-- For content search
ALTER TABLE ARTICLES ADD FULLTEXT INDEX ft_content (content);
ALTER TABLE ARTICLES ADD FULLTEXT INDEX ft_title (title);
```

---

## DATA RETENTION POLICIES

### Archive Strategy
- PLAYBACK_LOGS: Archive after 2 years
- ACCESS_LOGS: Archive after 1 year
- ERROR_LOGS: Archive after 6 months
- SPEECH_INPUTS: Archive after 1 year

### Cleanup Schedule
- ERROR_LOGS: Automatic cleanup of records older than 6 months
- TEMPORARY_FILES: Cleanup of extracted text after 30 days if not referenced

---

## PERFORMANCE CONSIDERATIONS

### Query Optimization Tips
1. Always use indexed columns in WHERE clauses
2. Use EXPLAIN before complex queries
3. Implement pagination for large result sets
4. Archive old PLAYBACK_LOGS and ACCESS_LOGS regularly

### Storage Estimate
- Audio Files: ~5MB per minute of speech
- Articles: ~0.5MB per article (average)
- For 1,000 users with 100 sessions each:
  - Estimated storage: 500GB - 1TB per year

---

## SECURITY CONSIDERATIONS

### Access Control
- Implement role-based access control (RBAC)
- Use encrypted passwords (bcrypt/argon2)
- Enable SSL/TLS for database connections

### Data Protection
- Enable audit logging for sensitive tables
- Backup critical data daily
- Implement data encryption at rest

---

**Document Version:** 1.0  
**Last Updated:** 2026-03-12  
**Database Version:** MySQL 8.0+
