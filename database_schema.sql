-- ============================================================================
-- VOICE NEWSPAPER WEB SCRAPING SYSTEM - DATABASE SCHEMA
-- For Visually Impaired Persons
-- ============================================================================
-- Database: voice_newspaper_db
-- Created: 2026-03-12
-- Version: 1.0
-- ============================================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS voice_newspaper_db;
USE voice_newspaper_db;

-- ============================================================================
-- TABLE: LANGUAGE
-- Purpose: Store supported language information
-- ============================================================================
CREATE TABLE LANGUAGE (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_code VARCHAR(5) NOT NULL UNIQUE,
    language_name VARCHAR(50) NOT NULL,
    locale VARCHAR(10),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: USERS
-- Purpose: Store user information and accessibility profiles
-- ============================================================================
CREATE TABLE USERS (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255),
    accessibility_profile VARCHAR(50),
    device_type VARCHAR(50),
    preferred_language_id INT,
    account_status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    FOREIGN KEY (preferred_language_id) REFERENCES LANGUAGE(language_id),
    INDEX idx_email (email),
    INDEX idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: PREFERENCES
-- Purpose: Store user preferences and settings
-- ============================================================================
CREATE TABLE PREFERENCES (
    preference_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    language_id INT,
    auto_play BOOLEAN DEFAULT TRUE,
    voice_speed VARCHAR(20) DEFAULT 'normal',
    audio_format VARCHAR(20) DEFAULT 'mp3',
    font_size INT DEFAULT 14,
    theme VARCHAR(20) DEFAULT 'light',
    notifications_enabled BOOLEAN DEFAULT TRUE,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES LANGUAGE(language_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: SCRAPING_SESSIONS
-- Purpose: Track web scraping sessions
-- ============================================================================
CREATE TABLE SCRAPING_SESSIONS (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    url_input VARCHAR(500) NOT NULL,
    session_status VARCHAR(20),
    session_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    session_end TIMESTAMP,
    duration_seconds INT,
    articles_scraped INT DEFAULT 0,
    error_message TEXT,
    INDEX idx_user (user_id),
    INDEX idx_status (session_status),
    INDEX idx_created (session_start),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: ARTICLES
-- Purpose: Store scraped article data
-- ============================================================================
CREATE TABLE ARTICLES (
    article_id INT PRIMARY KEY AUTO_INCREMENT,
    session_id INT NOT NULL,
    title VARCHAR(500) NOT NULL,
    content LONGTEXT NOT NULL,
    publish_date TIMESTAMP,
    source_url VARCHAR(500),
    word_count INT,
    scrape_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_processed BOOLEAN DEFAULT FALSE,
    INDEX idx_session (session_id),
    INDEX idx_title (title(100)),
    FOREIGN KEY (session_id) REFERENCES SCRAPING_SESSIONS(session_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: AUTHORS
-- Purpose: Store article author information
-- ============================================================================
CREATE TABLE AUTHORS (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT NOT NULL,
    author_name VARCHAR(200),
    author_email VARCHAR(120),
    INDEX idx_article (article_id),
    FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: HTML_OUTPUT
-- Purpose: Track generated HTML files
-- ============================================================================
CREATE TABLE HTML_OUTPUT (
    html_id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT NOT NULL,
    html_filename VARCHAR(255),
    html_path VARCHAR(500),
    template_used VARCHAR(50),
    file_size INT,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_article (article_id),
    FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: AUDIO_FILES
-- Purpose: Store converted audio file information
-- ============================================================================
CREATE TABLE AUDIO_FILES (
    audio_id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT NOT NULL,
    language_id INT,
    audio_filename VARCHAR(255) NOT NULL,
    audio_duration VARCHAR(20),
    format VARCHAR(20) DEFAULT 'mp3',
    file_path VARCHAR(500),
    file_size INT,
    conversion_engine VARCHAR(50),
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_article (article_id),
    INDEX idx_language (language_id),
    FOREIGN KEY (article_id) REFERENCES ARTICLES(article_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES LANGUAGE(language_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: PLAYBACK_LOGS
-- Purpose: Track audio playback history
-- ============================================================================
CREATE TABLE PLAYBACK_LOGS (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    audio_id INT NOT NULL,
    user_id INT NOT NULL,
    playback_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    playback_end TIMESTAMP,
    duration_played VARCHAR(20),
    device VARCHAR(100),
    INDEX idx_audio (audio_id),
    INDEX idx_user (user_id),
    INDEX idx_date (playback_start),
    FOREIGN KEY (audio_id) REFERENCES AUDIO_FILES(audio_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: ACCESS_LOGS
-- Purpose: Track HTML output access logs
-- ============================================================================
CREATE TABLE ACCESS_LOGS (
    access_id INT PRIMARY KEY AUTO_INCREMENT,
    html_id INT NOT NULL,
    user_id INT,
    accessed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    browser_type VARCHAR(100),
    ip_address VARCHAR(50),
    INDEX idx_html (html_id),
    INDEX idx_user (user_id),
    INDEX idx_accessed (accessed_at),
    FOREIGN KEY (html_id) REFERENCES HTML_OUTPUT(html_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: PDF_UPLOADS
-- Purpose: Store uploaded PDF file information
-- ============================================================================
CREATE TABLE PDF_UPLOADS (
    pdf_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    pdf_filename VARCHAR(255),
    pdf_path VARCHAR(500),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    file_size INT,
    total_pages INT,
    INDEX idx_user (user_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: EXTRACTED_TEXT
-- Purpose: Store text extracted from PDF files
-- ============================================================================
CREATE TABLE EXTRACTED_TEXT (
    extract_id INT PRIMARY KEY AUTO_INCREMENT,
    pdf_id INT NOT NULL,
    page_number INT,
    extracted_text LONGTEXT,
    extraction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_pdf (pdf_id),
    FOREIGN KEY (pdf_id) REFERENCES PDF_UPLOADS(pdf_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: SPEECH_INPUTS
-- Purpose: Store recorded audio input from users
-- ============================================================================
CREATE TABLE SPEECH_INPUTS (
    speech_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    audio_filename VARCHAR(255),
    audio_path VARCHAR(500),
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quality_rating VARCHAR(20),
    duration_seconds INT,
    language_id INT,
    INDEX idx_user (user_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (language_id) REFERENCES LANGUAGE(language_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: RECOGNIZED_TEXT
-- Purpose: Store text recognized from speech input
-- ============================================================================
CREATE TABLE RECOGNIZED_TEXT (
    text_id INT PRIMARY KEY AUTO_INCREMENT,
    speech_id INT NOT NULL,
    recognized_text LONGTEXT,
    confidence_score FLOAT,
    recognized_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_speech (speech_id),
    FOREIGN KEY (speech_id) REFERENCES SPEECH_INPUTS(speech_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: ERROR_LOGS
-- Purpose: Track system errors and issues
-- ============================================================================
CREATE TABLE ERROR_LOGS (
    error_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    session_id INT,
    error_code VARCHAR(50),
    error_message TEXT,
    error_stack_trace TEXT,
    error_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    severity VARCHAR(20),
    resolution VARCHAR(255),
    INDEX idx_timestamp (error_timestamp),
    INDEX idx_user (user_id),
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE SET NULL,
    FOREIGN KEY (session_id) REFERENCES SCRAPING_SESSIONS(session_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- TABLE: SYSTEM_STATS
-- Purpose: Store system performance and usage statistics
-- ============================================================================
CREATE TABLE SYSTEM_STATS (
    stat_id INT PRIMARY KEY AUTO_INCREMENT,
    stat_date DATE,
    total_sessions INT DEFAULT 0,
    total_articles_scraped INT DEFAULT 0,
    total_audio_files_generated INT DEFAULT 0,
    total_users_active INT DEFAULT 0,
    avg_session_duration INT DEFAULT 0,
    total_storage_used INT DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_date (stat_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================================
-- INSERT DEFAULT LANGUAGES
-- ============================================================================
INSERT INTO LANGUAGE (language_code, language_name, locale) VALUES
('en', 'English', 'en_US'),
('hi', 'Hindi', 'hi_IN'),
('ta', 'Tamil', 'ta_IN'),
('ml', 'Malayalam', 'ml_IN');

-- ============================================================================
-- CREATE INDEXES FOR OPTIMIZATION
-- ============================================================================
ALTER TABLE ARTICLES ADD FULLTEXT INDEX ft_content (content);
ALTER TABLE ARTICLES ADD FULLTEXT INDEX ft_title (title);

-- ============================================================================
-- CREATE VIEWS FOR COMMON QUERIES
-- ============================================================================

-- View: User Session Summary
CREATE OR REPLACE VIEW user_session_summary AS
SELECT 
    u.user_id,
    u.username,
    COUNT(DISTINCT ss.session_id) as total_sessions,
    COUNT(DISTINCT a.article_id) as total_articles,
    MAX(ss.session_start) as last_session,
    SUM(a.word_count) as total_words_processed
FROM USERS u
LEFT JOIN SCRAPING_SESSIONS ss ON u.user_id = ss.user_id
LEFT JOIN ARTICLES a ON ss.session_id = a.session_id
GROUP BY u.user_id, u.username;

-- View: Audio Generation Statistics
CREATE OR REPLACE VIEW audio_generation_stats AS
SELECT 
    l.language_name,
    COUNT(af.audio_id) as total_audio_files,
    SUM(afLANGUAGE.file_size) as total_storage,
    COUNT(DISTINCT af.article_id) as unique_articles,
    af.conversion_engine
FROM AUDIO_FILES af
LEFT JOIN LANGUAGE l ON af.language_id = l.language_id
GROUP BY l.language_id, l.language_name, af.conversion_engine;

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
