CREATE TABLE IF NOT EXISTS `ph7vz_couple_verifications` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `verifier_profile_id` INT UNSIGNED NOT NULL,
  `verified_profile_id` INT UNSIGNED NOT NULL,
  `note` VARCHAR(500) NOT NULL,
  `status` VARCHAR(20) NOT NULL DEFAULT 'active',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_couple_verifier_verified` (`verifier_profile_id`, `verified_profile_id`),
  KEY `idx_couple_verifier_status` (`verifier_profile_id`, `status`),
  KEY `idx_couple_verified_status` (`verified_profile_id`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

