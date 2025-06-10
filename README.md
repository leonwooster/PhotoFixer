# PhotoFixer

PhotoFixer is a cross-platform photo restoration mobile app built with Flutter (Dart) for Android and iOS. It leverages a Python backend (FastAPI or Flask) with integrated machine learning models (PyTorch) via REST APIs to restore and enhance old or damaged photos.

## Features
- Restore and enhance old or damaged photos using state-of-the-art ML models
- Secure authentication (Firebase Auth, OAuth/OpenID)
- Role-based access control
- Modern, accessible UI
- Supports Android and iOS

## Tech Stack
- **Frontend:** Flutter (Dart), Riverpod for state management
- **Backend:** Python (FastAPI or Flask)
- **ML Integration:** PyTorch models via REST APIs
- **Testing:** flutter_test, mockito, integration_test
- **CI/CD:** GitHub Actions or Bitrise

## Project Structure
```
lib/
  core/         # Shared services, constants, utils
  models/       # Data models (immutable, JSON serializable)
  features/     # Per-feature structure
    <feature_name>/
      views/
      widgets/
      providers/
      services/
  services/     # Global app services (e.g., AuthService)
  routes/       # Route management
  ui/           # Global UI elements
  main.dart     # Entry point
```

## Development Standards
- Use const constructors where possible
- Delegate logic to providers/services, not UI widgets
- All network calls via service layer, returning typed results
- Use `freezed` and `json_serializable` for data models
- Error handling via `Either` or custom `Result` types
- All service/network calls wrapped in try-catch
- Linting: `flutter_lints` or `very_good_analysis`
- Code coverage >80%, warnings treated as errors

## Getting Started
1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Run the app:**
   ```bash
   flutter run
   ```
4. **Backend setup:**
   - See `/backend/README.md` for Python backend setup instructions.

## Security & Deployment
- Store tokens securely with `flutter_secure_storage`
- Use HTTPS for all requests
- Separate Firebase projects per environment (dev/staging/prod)
- Protect production keys; use CI/CD secrets

## Contributing
- Pull requests require 2 reviewers
- Pre-commit: format, analyze, test
- All releases follow [semantic versioning](https://semver.org/)

## License
[MIT](LICENSE)

---
Build once, test often, ship with confidence 🚀
