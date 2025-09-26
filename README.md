# 💧 water_reminder_app

A Flutter-based **Water Reminder application** that helps users stay hydrated with smart notifications, tracking, and analytics.  
Built using **Flutter**, **Clean Architecture**, **Cubit (BLoC)**, and **Dependency Injection** with `get_it`.

---

## 🚀 Features

- 🔔 Smart daily notifications for water intake
- 📊 Hydration tracking with charts (using `fl_chart`)
- 🧾 History of daily intake
- 📡 Network handling with `connectivity_plus`
- 💾 Local storage with `hive_flutter`
- 🛠️ Modular and scalable architecture

---

## 📦 Dependencies

Key packages used in this project:

- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) → State management (Cubit)
- [`get_it`](https://pub.dev/packages/get_it) → Dependency injection
- [`go_router`](https://pub.dev/packages/go_router) → Navigation
- [`dio`](https://pub.dev/packages/dio) → Networking
- [`hive_flutter`](https://pub.dev/packages/hive_flutter) → Local storage
- [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications) → Local notifications
- [`timezone`](https://pub.dev/packages/timezone) → Timezone handling for reminders
- [`fl_chart`](https://pub.dev/packages/fl_chart) → Graphs and analytics
- [`permission_handler`](https://pub.dev/packages/permission_handler) → Notification & system permissions

---

## 🏗️ Architecture

The project follows **Clean Architecture + Cubit Injection**:

- `core/` → Constants, services, dependency injection, error handling
- `features/` → App modules (hydration, reminders, stats, etc.)
- `shared/` → Common widgets, themes, utils
- `main.dart` → Application entry point

---

## 📱 Download APK

👉 [Click here to download Water Reminder App APK](https://github.com/Pugalesh-KM/water_reminder_app/blob/main/assets/apk/water_reminder_app.apk)

---

## ▶️ Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/Pugalesh-KM/water_reminder_app.git
cd water_reminder_app
