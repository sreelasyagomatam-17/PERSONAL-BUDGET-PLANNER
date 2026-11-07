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

## Experiment 7: Designing Forms with Various Input Fields and Implementing Form Validation and Error Handling

### Aim
To design forms using different Flutter input widgets, collect user information, validate inputs, and display appropriate error messages.

### Concepts Used
1. Form and GlobalKey<FormState>
2. TextFormField for transaction title and amount.
3. Input validation for required title and positive amount.
4. DropdownButtonFormField for transaction category.
5. RadioGroup and RadioListTile for Income and Expense selection.
6. CheckboxListTile for transaction confirmation.
7. SnackBar for displaying error messages.
8. TextEditingController for managing input values.

### Implementation
The Personal Budget Planner application uses a form to add transactions. Users enter the transaction title and amount, select the transaction type and category, and confirm the details before saving.

### Validation and Error Handling
- Transaction title cannot be empty.
- Amount must be greater than zero.
- Users must confirm transaction details before saving.
- SnackBar displays a friendly error message when confirmation is missing.

### Result
Successfully designed and implemented a transaction form using various Flutter input widgets with form validation and error handling.

## Experiment 8: Implementing UI Animations Using Flutter

### Aim
1. To understand animation fundamentals in Flutter.
2. To implement animations using the Flutter animation framework.
3. To create fade and slide animations for UI elements.
4. To improve user experience using animated widgets.

### Implementation
1. AnimatedContainer: Changes the size and color of a container using Curves.easeInOut.
2. Fade Animation: Uses AnimatedOpacity to show and hide the Flutter logo.
3. Slide Animation: Uses AnimatedPositioned to move an orange square.
4. Buttons are provided to control each animation.

### Widgets Used
- AnimatedContainer
- AnimatedOpacity
- AnimatedPositioned
- Stack
- FlutterLogo
- ElevatedButton

### Result
Successfully implemented and tested container, fade, and slide animations in the Personal Budget Planner application.

## Experiment 9: Fetching Data from a REST API

### Aim
1. To understand REST API concepts.
2. To fetch data using the HTTP package.
3. To parse JSON responses.
4. To display API data using Flutter widgets.

### API Used
https://jsonplaceholder.typicode.com/users

### Implementation
1. Added the HTTP package to pubspec.yaml.
2. Performed HTTP GET requests using the http package.
3. Parsed JSON data using jsonDecode().
4. Displayed user names and email addresses using ListView.builder.
5. Used Card and ListTile widgets.
6. Implemented loading indicators and error handling.
7. Added a refresh button to fetch data again.

### Result
Successfully fetched user details from a REST API, parsed JSON data, and displayed the results in the Personal Budget Planner application.

## Experiment 10: Writing Unit Tests for Flutter UI Components and Using Flutter Debugging Tools

### Aim
1. To understand software testing in Flutter.
2. To write unit tests for Flutter UI components.
3. To execute test cases using the Flutter testing framework.
4. To use Flutter debugging tools to identify and fix issues.

### Implementation

**1. Unit Testing**

Created `lib/utils/calculator.dart` with methods for:
- Addition
- Subtraction
- Multiplication

Created `test/calculator_test.dart` using the Flutter testing framework.

**2. Widget Testing**

Created widget tests in `test/widget_test.dart` to verify:
- Personal Budget Planner dashboard title.
- Add Transaction button.
- Current Balance text.
- Add Transaction form validation for empty title and invalid amount.

**3. Flutter Testing Tools**

Used:
- `flutter_test` package.
- `test()` for unit testing.
- `testWidgets()` for widget testing.
- `expect()` and matchers to verify expected results.
- `WidgetTester` to interact with widgets.

**4. Debugging Tools**

Used the following Flutter debugging tools:
- Flutter Inspector to inspect the widget tree and layout.
- Debug Console to view errors and debugging messages.
- Breakpoints to pause execution and inspect variables.
- Flutter DevTools to analyze application performance.
- `flutter analyze` to identify code issues.
- Hot Reload to view code changes quickly.
- Hot Restart to restart the application.

### Test Execution

Command:
`flutter test`

Result: All 5 tests passed successfully.

### Conclusion

Successfully implemented unit testing and widget testing in the Personal Budget Planner application. Executed all test cases successfully and learned to use Flutter debugging tools to identify and resolve application issues.