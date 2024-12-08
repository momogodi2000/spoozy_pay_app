import 'package:flutter/material.dart';
import '../../models/transaction/transaction_view_models.dart';

class TransactionCard extends StatelessWidget {
  final Transaction_page transaction;

  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          transaction.type == "Deposit"
              ? Icons.arrow_downward
              : transaction.type == "Withdraw"
              ? Icons.arrow_upward
              : Icons.swap_horiz,
          color: Colors.blue,
        ),
        title: Text(transaction.type, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${transaction.paymentMethod} | ${transaction.date.toLocal()}"),
        trailing: Text(
          "\$${transaction.amount.toStringAsFixed(2)}",
          style: TextStyle(
            color: transaction.status == "Success" ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
