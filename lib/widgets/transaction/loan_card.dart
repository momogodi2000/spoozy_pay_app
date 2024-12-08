import 'package:flutter/material.dart';
import '../../models/transaction/loan_transaction.dart';

class LoanCard extends StatelessWidget {
  final Loan_page loan;

  const LoanCard({Key? key, required this.loan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.attach_money, color: Colors.blue),
        title: Text(
          "Borrower: ${loan.borrower} | Lender: ${loan.lender}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Due Date: ${loan.dueDate.toLocal()}",
        ),
        trailing: Text(
          "\$${loan.amount.toStringAsFixed(2)}",
          style: TextStyle(
            color: loan.status == "Ongoing" ? Colors.orange : Colors.green,
          ),
        ),
      ),
    );
  }
}
