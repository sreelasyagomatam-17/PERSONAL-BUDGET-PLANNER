import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:personal_budget_planner/main.dart';
import 'package:personal_budget_planner/providers/transaction_provider.dart';

void main() {
  testWidgets('Verify Personal Budget Planner Dashboard',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TransactionProvider(),
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Personal Budget Planner'), findsOneWidget);
    expect(find.text('Add Transaction'), findsOneWidget);
    expect(find.text('Current Balance'), findsOneWidget);
  });

  testWidgets('Verify Add Transaction Form Validation',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddTransactionScreen(),
      ),
    );

    await tester.tap(find.text('Save Transaction'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter a title'), findsOneWidget);
    expect(
      find.text('Enter an amount greater than zero'),
      findsOneWidget,
    );
  });
}