# SkillSwap

A Flutter app UI for a peer-to-peer skill-exchange platform that uses a time-based bartering system where users teach and learn skills for free.

## Overview

SkillSwap is a mobile application that allows users to exchange skills with others. The app uses a point-based system where teaching increases points (+1) and learning decreases points (-1). This creates a balanced ecosystem where users are encouraged to both teach and learn.

## Features

- **Authentication**: Sign up and login screens with social login options (UI only)
- **Home Screen**: Displays past interactions and recommended teachers
- **Search Screen**: Find users offering skills you want to learn or users looking to learn skills you can teach
- **Profile Screen**: View and manage your profile, skills, and points
- **Reward System**: Visual representation of point changes when teaching or learning

## Technical Details

- Built with Flutter
- Uses Riverpod for state management
- Implements a clean, modular architecture
- Features a modern UI design with a purple, blue, and white color palette

## Project Structure

```
lib/
├── models/         # Data models
├── providers/      # Riverpod state providers
├── screens/        # UI screens
├── theme/          # Theme configuration
├── utils/          # Utility functions and dummy data
├── widgets/        # Reusable UI components
└── main.dart       # Entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- An IDE (VS Code, Android Studio, etc.)

### Installation

1. Clone this repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Note

This is a UI-only implementation with no backend functionality. All data is simulated using dummy data.
