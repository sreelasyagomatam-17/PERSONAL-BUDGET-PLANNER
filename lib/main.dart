
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> transactions = [];

  void addTransaction(Map<String, dynamic> transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Budget Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/add') {
          return MaterialPageRoute(
            builder: (_) => const AddTransactionScreen(),
          );
        }

        if (settings.name == '/history') {
          return MaterialPageRoute(
            builder: (_) => HistoryScreen(
              transactions: transactions,
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) => DashboardScreen(
            transactions: transactions,
            onAdd: addTransaction,
          ),
        );
      },
      home: DashboardScreen(
        transactions: transactions,
        onAdd: addTransaction,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  final Function(Map<String, dynamic>) onAdd;

  const DashboardScreen({
    super.key,
    required this.transactions,
    required this.onAdd,
  });

  double get totalIncome {
    return transactions
        .where((t) => t['type'] == 'Income')
        .fold(0.0, (sum, t) => sum + (t['amount'] as double));
  }

  double get totalExpenses {
    return transactions
        .where((t) => t['type'] == 'Expense')
        .fold(0.0, (sum, t) => sum + (t['amount'] as double));
  }

  Future<void> openAddScreen(BuildContext context) async {
  final result = await Navigator.push<Map<String, dynamic>>(
    context,
    MaterialPageRoute(
      builder: (context) => const AddTransactionScreen(),
    ),
  );

  if (!context.mounted) return;

  if (result != null) {
    onAdd(result);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Budget Planner'),
        actions: [
          IconButton(
            tooltip: 'Transaction history',
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final int columns = constraints.maxWidth >= 700 ? 2 : 1;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Experiment 2: Container, Stack, Text and Icon
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Manage Your Money',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Plan today. Save for tomorrow.',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.account_balance_wallet,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Balance card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Text('Current Balance'),
                        const SizedBox(height: 8),
                        Text(
                          '₹${(totalIncome - totalExpenses).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Experiment 3: Responsive layout for mobile and desktop screens
                GridView.count(
                  crossAxisCount: columns,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.4,
                  children: [
                    SummaryCard(
                      title: 'Income',
                      amount: totalIncome,
                      icon: Icons.arrow_downward,
                      color: Colors.green,
                    ),
                    SummaryCard(
                      title: 'Expenses',
                      amount: totalExpenses,
                      icon: Icons.arrow_upward,
                      color: Colors.red,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                if (transactions.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'No transactions yet. Add your first transaction!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  ...transactions.reversed.take(5).map(
                    (transaction) => TransactionTile(
                      transaction: transaction,
                    ),
                  ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () => openAddScreen(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Transaction'),
                ),

                const SizedBox(height: 10),

                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/history');
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('View All Transactions'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final double amount;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(
                    '₹${amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final bool isIncome = transaction['type'] == 'Income';

    return Card(
      child: ListTile(
        leading: Icon(
          isIncome ? Icons.arrow_downward : Icons.arrow_upward,
          color: isIncome ? Colors.green : Colors.red,
        ),
        title: Text(transaction['title'] as String),
        subtitle: Text(
          '${transaction['category']} • ${transaction['type']}',
        ),
        trailing: Text(
          '${isIncome ? '+' : '-'}₹${(transaction['amount'] as double).toStringAsFixed(2)}',
          style: TextStyle(
            color: isIncome ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String _type = 'Expense';
  String _category = 'Food';

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void saveTransaction() {
    if (!_formKey.currentState!.validate()) return;

    final transaction = <String, dynamic>{
      'title': _titleController.text.trim(),
      'amount': double.parse(_amountController.text.trim()),
      'type': _type,
      'category': _category,
    };

    Navigator.pop(context, transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Transaction title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixText: '₹ ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final amount = double.tryParse(value ?? '');
                  if (amount == null || amount <= 0) {
                    return 'Enter an amount greater than zero';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: _type,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                items: ['Income', 'Expense']
                    .map(
                      (type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _type = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Food',
                  'Travel',
                  'Education',
                  'Shopping',
                  'Salary',
                  'Other',
                ]
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _category = value;
                    });
                  }
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: saveTransaction,
                child: const Text('Save Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const HistoryScreen({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: transactions.isEmpty
          ? const Center(child: Text('No transactions available'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionTile(
                  transaction: transactions[
                    transactions.length - 1 - index
                  ],
                );
              },
            ),
    );
  }
}
