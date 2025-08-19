# GraceCottage (Flutter + Firebase)

This zip contains the full **lib/** source, Provider setup, Firebase Auth, Firestore products,
Cart, Orders, Profile, and Admin (Add/Edit/Delete with image upload). It also includes
**placeholder Firebase config files** you must replace.

## Quick Start

1) Ensure Flutter SDK is installed.
2) Create platform folders (Android/iOS) if missing:
   ```bash
   flutter create .
   ```
3) Replace Firebase placeholders:
   - `android/app/google-services.json`  ← from Firebase Console (Android)
   - `ios/Runner/GoogleService-Info.plist` ← from Firebase Console (iOS)

4) Android Gradle config (after you run `flutter create .`):
   - In `android/build.gradle`, ensure:
     ```gradle
     dependencies {
         classpath 'com.google.gms:google-services:4.4.2'
     }
     ```
   - In `android/app/build.gradle`, at the bottom add:
     ```gradle
     apply plugin: 'com.google.gms.google-services'
     ```

5) Get packages:
   ```bash
   flutter pub get
   ```

6) Run the app:
   ```bash
   flutter run
   ```

### Firestore Collections
- `products`: { id, name, description, price, category?, imageUrl, createdAt }
- `orders`: { userId, date, total, status, items: [{name, quantity, price}] }

### Admin Login
Any authenticated user can access Admin tab by default in this template.
Add role checks later if desired.

Good luck & happy building!
# GRACECOTTAGE
