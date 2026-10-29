# 

# \# Personal Budget Planner

# 

# A Flutter application designed to help users track income, expenses, and transactions through a simple and responsive dashboard.

# 

# \## Features

# \- Dashboard displaying balance, income, and expenses

# \- Add income and expense transactions

# \- Select transaction categories

# \- View transaction history

# \- Responsive user interface

# \- Navigation between screens

# 

# \## Technologies Used

# \- Flutter

# \- Dart

# \- Material Design

# 

# \## Experiments

# 

# \### Experiment 1: Dart Basics

# Implemented a Dart program to understand basic language concepts.

# 

# \### Experiment 2: Flutter Widgets and Layouts

# Explored Flutter widgets such as Text, Container, Icon, Row, Column, and Stack.

# 

# \### Experiment 3: Responsive UI

# Implemented a responsive layout that adapts to different screen sizes.

# 

# \### Experiment 4: Navigation Between Screens

# Implemented navigation to the Add Transaction and Transaction History screens using Flutter Navigator and named routes. Tested opening screens and saving transactions.

# 

# \## Getting Started

# 1\. Install Flutter and Dart.

# 2\. Clone this repository.

# 3\. Navigate to the project directory.

# 4\. Run `flutter pub get`.

# 5\. Run `flutter run`.

# 

# \## Repository

# GitHub: https://github.com/sreelasyagomatam-17/PERSONAL-BUDGET-PLANNER

# 

### Experiment 5: State Management with Provider

**Aim:** To manage application state using Provider and ChangeNotifier.

**Implementation:**
- Created `TransactionProvider` to manage the transaction list.
- Used `ChangeNotifier` and `notifyListeners()` to notify the UI when transactions change.
- Used `context.watch()` to listen for changes and rebuild the UI.
- Used `context.read()` to add transactions through the provider.

**Result:** Income and expense transactions are saved successfully, dashboard totals update, and transaction history displays the saved transactions.

### Experiment 6: Custom Widgets, Themes and Styles

**Aim:** To create reusable custom widgets and apply application themes and custom styles in Flutter.

**Implementation:**
- Created a reusable `SummaryCard` widget for displaying income and expenses.
- Styled cards using custom icons, colors, padding, and rounded corners.
- Configured a consistent application theme using `ThemeData`.
- Customized the app bar, card appearance, and elevated buttons.
- Used `Theme.of(context)` and `TextTheme` to apply consistent text styling.

**Result:** The Personal Budget Planner displays consistently styled dashboard cards and application components while preserving existing transaction functionality.