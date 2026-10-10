void main() {
  // Variables and data types
  String studentName = 'Student';
  int monthlyBudget = 10000;
  double expenses = 3500.50;
  bool isWithinBudget = expenses <= monthlyBudget;

  print('PERSONAL BUDGET PLANNER - DART BASICS');
  print('Name: $studentName');
  print('Monthly Budget: Rs. $monthlyBudget');
  print('Expenses: Rs. $expenses');
  print('Remaining: Rs. ${monthlyBudget - expenses}');

  // Conditional statement
  if (isWithinBudget) {
    print('Status: Within budget');
  } else {
    print('Status: Over budget');
  }

  // Loop
  print('\nExpense categories:');
  List<String> categories = ['Food', 'Travel', 'Education'];

  for (String category in categories) {
    print(category);
  }

  // Function
  print(
    '10% of budget: Rs. ${calculatePercentage(monthlyBudget.toDouble(), 10.0)}',
  );
} // End of main function

// User-defined function
double calculatePercentage(double amount, double percentage) {
  return amount * percentage / 100;
}