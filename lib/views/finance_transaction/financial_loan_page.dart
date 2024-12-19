// lib/views/financial_loan_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/finance_transaction/finance_loan_vm.dart';

class FinancialLoanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoanViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Financial Loans'),
          elevation: 0,
        ),
        body: Consumer<LoanViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLoanRequestForm(viewModel, context),
                    SizedBox(height: 24),
                    _buildLoanHistory(viewModel),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoanRequestForm(LoanViewModel viewModel, BuildContext context) {
    final amountController = TextEditingController();
    final lenderIdController = TextEditingController();

    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request Loan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Loan Amount',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: lenderIdController,
              decoration: InputDecoration(
                labelText: 'Lender ID',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: viewModel.isLoading
                    ? null
                    : () async {
                  final amount = double.tryParse(amountController.text);
                  if (amount != null && lenderIdController.text.isNotEmpty) {
                    await viewModel.requestLoan(amount, lenderIdController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Loan request submitted')),
                    );
                  }
                },
                icon: Icon(Icons.send),
                label: Text('Submit Request'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanHistory(LoanViewModel viewModel) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loan History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (viewModel.loans.isEmpty)
              Center(
                child: Text('No loans yet'),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.loans.length,
                itemBuilder: (context, index) {
                  final loan = viewModel.loans[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_balance,
                        color: Colors.blue,
                      ),
                      title: Text('\$${loan.amount}'),
                      subtitle: Text('Status: ${loan.status}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Due: ${loan.dueDate?.toString().split(' ')[0] ?? 'N/A'}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            loan.status,
                            style: TextStyle(
                              color: _getLoanStatusColor(loan.status),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Color _getLoanStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}