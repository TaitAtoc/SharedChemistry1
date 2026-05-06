SharedChemistry Restore Point - 2026-05-06

Current stable status:
- Admin login works again.
- Admin reset was used successfully.
- Signup Step 2 and Step 3 are back to the working original-style flow.
- Broken Step 2 JoinForm redesign was removed from the deploy path.
- Do not touch JoinForm.php again for visual layout work.

Important commits:
- 25bd8f0e Restore working signup JoinForm
- 2aed6729 Fix getId dynamic id column lookup
- f82279c Fix admin first name lookup
- 734b301d Fix admin table validation throw path

Latest known working live state:
- Admin login page loads and accepts reset credentials.
- User signup flow loads Step 2 and Step 3 again.
- Step 2 design work must restart as template/CSS only.
- Do not redesign inside JoinForm.php.

Admin reset file:
- sc-admin-reset.php was used.
- Rename/delete it from live root after confirming admin access.

Next safe work:
1. Confirm admin login still works.
2. Confirm signup still works.
3. Remove/disable sc-admin-reset.php.
4. Restart Step 2 design using template/CSS wrapper only.
