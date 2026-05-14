CREATE TABLE IF NOT EXISTS `ph7vz_sc_chatroom_messages` (
  `messageId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `senderId` INT UNSIGNED NOT NULL,
  `messageText` VARCHAR(500) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `idx_sc_chatroom_sender` (`senderId`),
  KEY `idx_sc_chatroom_created` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
