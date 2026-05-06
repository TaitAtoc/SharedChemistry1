SharedChemistry Restore Point - Admin Recovered - 2026-05-06

Stable status:
- Admin login is working again.
- Admin password was reset using pH7 Security::hashPwd.
- Working admin login:
  Email: tait@anzsbs.com
  Username: Tait
  Password: 123456789
- Signup Step 2 and Step 3 are back to the working original-style flow.
- Captcha/cache helper was run and cleared pH7 cache.
- Do not touch JoinForm.php for visual layout work.

Important admin recovery commits:
- 2aed6729 Fix getId dynamic id column lookup
- f82279c Fix admin first name lookup
- 734b301d Fix admin table validation throw path
- 9aad30f Add captcha disable and cache clear helper
- 8d1cf80 Allow admin login tables in validator
- 734b301d / later Various.class.php patch allowed admin validator path
- Admin login helper reset password with pH7 hash.

Live helper files should be disabled:
- sc-admin-reset.php.disabled
- sc-admin-login-fix.php.disabled
- sc-disable-captcha-and-clear-cache.php.disabled

Next safe work:
- Restart signup Step 2 design as template/CSS only.
- Do not edit JoinForm.php.
- Do not edit auth/model files unless fixing a proven logged error.
