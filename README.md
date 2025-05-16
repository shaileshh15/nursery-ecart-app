# Nursery E-Cart App

A Flutter-based e-commerce application for nursery products and gardening supplies, featuring a modern UI and robust backend functionality.

## Features
- 🌱 Browse extensive nursery product catalog
- 🛒 Shopping cart with quantity management
- 🎟️ Wishlist functionality
- 📱 Responsive design for all devices
- 🔐 Secure authentication system
- 🔔 Real-time notifications
- 📊 Admin dashboard for product and order management

## Architecture & State Management

### State Management
The app uses the Provider package for state management, implementing a clean and maintainable architecture:

1. **MultiProvider Setup**
   - CartProvider - Manages shopping cart state
   - WishlistProvider - Manages wishlist state

2. **Data Flow**
   - UI components listen to state changes using Consumer widgets
   - State updates trigger automatic UI refresh
   - Centralized state management reduces complexity

3. **Benefits**
   - Predictable state updates
   - Easy debugging with ChangeNotifier
   - Efficient memory management
   - Type-safe state handling

## Technologies Used
- Flutter & Dart
- Firebase (Authentication, Database, Storage)
- Provider (State Management)
- ScreenUtil (Responsive Design)
- Firebase Core & Auth

## Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Android Studio/VS Code
- Git
- Firebase account

### Installation
1. Clone the repository:
```bash
git clone https://github.com/shaileshh15/nursery-ecart-app.git
```

2. Install dependencies:
```bash
cd nursery-ecart-app
flutter pub get
```

3. Configure Firebase:
   - Create a Firebase project
   - Add `google-services.json` for Android
   - Add `GoogleService-Info.plist` for iOS

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── admin/           # Admin dashboard features
├── models/          # Data models
├── screens/         # UI screens
├── widgets/         # Reusable UI components
└── main.dart        # App entry point with Provider setup
```

## Contributing
Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
