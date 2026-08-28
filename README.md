<div align="center">

# ⚡ SaaS UI Web Dashboard

**A modern, responsive, and high-performance SaaS Web Dashboard built with Flutter Web.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/State%20Management-Riverpod-2E7D32?style=for-the-badge)](https://riverpod.dev)
[![GoRouter](https://img.shields.io/badge/Routing-Go__Router-FF6F00?style=for-the-badge)](https://pub.dev/packages/go_router)
[![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

<p align="center">
  <a href="#-key-features">Key Features</a> •
  <a href="#-tech-stack">Tech Stack</a> •
  <a href="#-architecture">Architecture</a> •
  <a href="#-getting-started">Getting Started</a> •
  <a href="#-build--deployment">Build & Deployment</a> •
  <a href="#-project-structure">Structure</a>
</p>

</div>

---

## 🌟 Key Features

- 💎 **Modern UI/UX Design**: Sleek, clean, and intuitive SaaS dashboard interface with custom design tokens, dark/light themes, and reusable components.
- 📱 **Fully Responsive Layout**: Seamlessly adapted for desktop, tablet, and mobile browsers.
- ⚡ **Reactive State Management with Riverpod**: Type-safe, scalable, and testable state powered by `flutter_riverpod` and `riverpod_generator`.
- 🛣️ **Declarative Routing with GoRouter**: Robust deep-linking, auth guards, nested routes, and redirection handling.
- 📊 **Interactive Analytics & Charts**: Integrated with `fl_chart` for dynamic metric visualization and business reporting.
- 🔐 **Authentication & Security**: Complete auth lifecycle, session caching via `shared_preferences`, and Dio/Retrofit interceptors for secure token management.
- 📄 **Document & File Handling**: PDF preview powered by `pdfrx`, report exports, and file downloads with `file_saver`.
- 🎨 **Asset Code Generation**: Type-safe access to images, icons, and SVG files with `flutter_gen_runner`.
- 🌐 **Internationalization (i18n)**: Fully prepared for multilingual support using `flutter_localizations` and `intl`.

---

## 🛠 Tech Stack

| Category | Technologies & Packages |
|---|---|
| **Framework** | Flutter Web (Dart 3.x) |
| **State Management** | Flutter Riverpod, Riverpod Generator, Freezed |
| **Networking & API** | Dio, Retrofit, JSON Serializable |
| **Navigation** | GoRouter |
| **UI & Styling** | Google Fonts, Flutter SVG, Cupertino & Material Icons, Desktop Drop |
| **Data Visualization** | FL Chart |
| **Documents & Storage** | PDFRx, File Saver, Shared Preferences, URL Launcher, Path Provider |
| **Code Generation & Tooling**| Build Runner, Flutter Gen Runner, Flutter Lints |

---

## 🏗 Architecture

The codebase follows a **Feature-First Architecture**, ensuring modularity, clear separation of concerns, and high maintainability:

```text
lib/
├── main.dart                   # Application entry point
└── src/
    ├── app.dart                # MaterialApp configuration, routing & theme setup
    ├── core/                   # Shared services, themes, base utilities & code generation
    │   ├── gen/                # Auto-generated assets (FlutterGen)
    │   ├── network/            # HTTP clients, interceptors, API definitions
    │   └── theme/              # Color palettes, typography, theme data
    ├── features/               # Domain-driven feature modules
    │   ├── auth/               # Sign in, registration, password recovery
    │   ├── buy/                # Pricing tiers, checkout & subscription flows
    │   ├── home/               # Dashboard overview, analytics & statistics
    │   ├── qr_code/            # QR code generation & scanning utilities
    │   ├── settings/           # Account preferences & user settings
    │   ├── support/            # Help center, ticketing & feedback
    │   ├── logo/               # Branding assets and components
    │   ├── loading/            # Splash screen & global loading states
    │   └── not_found/          # 404 error screen
    └── shared/                 # Reusable UI-kit, buttons, inputs, dialogs & layouts
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (`^3.11.5` or latest stable version)
- Google Chrome or any modern web browser

### 1. Clone the repository
```bash
git clone https://github.com/your-username/saas-ui.git
cd saas-ui
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run code generation (Riverpod, Freezed, Retrofit, Assets)
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Launch in development mode
```bash
flutter run -d chrome
```

---

## 📦 Build & Deployment

Convenient shell scripts are included to streamline builds and deployments:

- **Build Web Release**:
  ```bash
  ./sh_flutter_build_web.sh
  ```
- **Deploy to Hosting / Production**:
  1. Copy the template and configure your server credentials:
     ```bash
     cp .deploy_config.example .deploy_config
     ```
  2. Run the deployment script:
     ```bash
     ./sh_deploy.sh
     ```

---

## 💻 Development & Code Quality

Run static analysis and linter:
```bash
flutter analyze
```

Format codebase:
```bash
dart format .
```

---

<div align="center">
  <sub>Crafted with passion for clean code and modern design ✨</sub>
</div>
