# PennyTracker — setup guide

## Important
This is a starter app, not a security-audited financial product. Do not enter real financial records until the database is configured, the app is deployed over HTTPS, and access is tested using two separate accounts.

## Included
- Browser interface for phone and laptop
- Supabase email/password authentication
- Cloud-synced income and expense records
- Monthly totals, category breakdown, search, and CSV export

Category budgets, payment reminders, voice entry, and a polished installable PWA are not included yet.

## 1. Create a free-tier Supabase project
1. Go to https://supabase.com/ and create an account/project.
2. In the project dashboard, open SQL Editor and run the contents of `schema.sql`.
3. Find the Project URL and the publishable key (or legacy anon key) in project API settings.
4. Never put a service-role or secret key into this browser app.

## 2. Deploy the app
Deploy `index.html` to a static HTTPS host. GitHub Pages can host the app at no cost, but the repository/source is public if the repository is public. The database records are not stored in GitHub; they are stored in Supabase and protected by the SQL row-level security policies. Do not place private records, keys, or exports in the repository.

## 3. Connect
Open the deployed app, enter the Supabase Project URL and publishable/anon key, then create an account and sign in. Configure Supabase Authentication URL settings with your deployed HTTPS app URL and allowed redirect URL.

## 4. Test before real use
Create test accounts A and B. Add a record while signed in as A, sign out, and sign in as B. B must not be able to see, edit, or delete A's record. Also test sign-out and CSV export. If any test fails, do not use the app for real financial data.

## 5. Free tier / backups
Free plans have limits and terms can change; some free projects may pause after inactivity and automatic backups may not be included. Export a CSV backup regularly and store it privately. Never store bank passwords, OTPs, card PINs, or UPI PINs here.
