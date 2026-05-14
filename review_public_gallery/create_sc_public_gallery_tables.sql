CREATE TABLE IF NOT EXISTS `ph7vz_sc_public_gallery_photos` (
  `photoId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `uploaderId` INT UNSIGNED NOT NULL,
  `title` VARCHAR(120) NOT NULL DEFAULT '',
  `caption` VARCHAR(500) NOT NULL DEFAULT '',
  `fileName` VARCHAR(255) NOT NULL,
  `filePath` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `approved` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`photoId`),
  KEY `idx_sc_public_gallery_photos_uploader` (`uploaderId`),
  KEY `idx_sc_public_gallery_photos_created` (`createdAt`),
  KEY `idx_sc_public_gallery_photos_approved` (`approved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ph7vz_sc_public_gallery_comments` (
  `commentId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `photoId` INT UNSIGNED NOT NULL,
  `commenterId` INT UNSIGNED NOT NULL,
  `commentText` VARCHAR(500) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `approved` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`commentId`),
  KEY `idx_sc_public_gallery_comments_photo` (`photoId`),
  KEY `idx_sc_public_gallery_comments_commenter` (`commenterId`),
  KEY `idx_sc_public_gallery_comments_created` (`createdAt`),
  KEY `idx_sc_public_gallery_comments_approved` (`approved`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
