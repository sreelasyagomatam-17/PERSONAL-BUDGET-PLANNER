import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _transactions = [];

  List<Map<String, dynamic>> get transactions =>
      List.unmodifiable(_transactions);

  void addTransaction(Map<String, dynamic> transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void clearTransactions() {
    _transactions.clear();
    notifyListeners();
  }
}