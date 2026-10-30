# My Money – Personal Finance PWA

A free, mobile-first personal finance tracker. It stores data locally in the browser on the device where it is used.

## Files
- `index.html` – app
- `manifest.webmanifest` – install metadata
- `sw.js` – offline service worker
- `icon.svg` – app icon

## Install on Android
1. Host these files on an HTTPS static host (GitHub Pages is free).
2. Open the published URL in Chrome on Android.
3. Use Chrome menu → **Add to Home screen** or **Install app**.
4. Open it from the new home-screen icon.

## Free GitHub Pages hosting
1. Sign in or create a GitHub account.
2. Create a new public repository, e.g. `my-money-app`.
3. Upload all four app files to the repository root.
4. Open repository **Settings → Pages**.
5. Under Build and deployment, choose **Deploy from a branch**, select `main` and `/ (root)`, then Save.
6. Wait for GitHub Pages to publish. Open the shown HTTPS URL on your Android phone and install it.

## Privacy and backups
- No account or bank connection.
- Transactions are saved in local browser storage on this device.
- Data does not automatically sync between devices.
- Use Settings → Export backup regularly. Keep the JSON backup somewhere safe.
- Import backup restores the saved data and replaces current local data.
- Avoid clearing browser site data unless you have a backup.

## Financial tracking notes
- BHD is the accounting currency. If you have an INR amount, record the original INR figure and exchange-rate details in Notes after converting it to BHD yourself.
- Income/expense reports include only transaction types Income and Expense.
- Borrowed money, debt repayments, money lent and money received are tracked separately to avoid misclassifying cash movements.
- Debt and receivable registers hold current balances. Update those balances when recording repayments/collections.
- This app is a record-keeping tool, not financial, tax or investment advice.
