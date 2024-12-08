// loan_details_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/loan/loan_details_view_model.dart';
import '../../models/loan/loan_details_model.dart';

class LoanDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoanDetailsViewModel(),
      child: Scaffold(
        body: _LoanDetailsView(),
      ),
    );
  }
}

class _LoanDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoanDetailsViewModel>();
    final loan = viewModel.loanDetails;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(context),
              SizedBox(height: 20),
              _buildLoanAmountCard(loan, size),
              SizedBox(height: 20),
              _buildLoanDetailsCard(loan, size),
              SizedBox(height: 20),
              _buildActionButtons(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _buildLoanAmountCard(LoanDetails loan, Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Loan amount:',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '${loan.loanAmount.toStringAsFixed(2)} USD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            loan.loanDate,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoanDetailsCard(LoanDetails loan, Size size) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildDetailRow('Amount left to be paid', '\$${loan.amountLeft.toStringAsFixed(2)}'),
            _buildDetailRow('Total paid', '\$${loan.totalPaid.toStringAsFixed(2)}'),
            _buildDetailRow('Monthly payment', '\$${loan.monthlyPayment.toStringAsFixed(2)}'),
            _buildDetailRow('Loan period', '${loan.loanPeriod} months'),
            _buildDetailRow('Rate', '${loan.rate}%'),
            _buildDetailRow('Finish date', loan.finishDate),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, LoanDetailsViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => viewModel.repayLoan(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Repay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.description_outlined),
                label: Text('Statement'),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.description_outlined),
                label: Text('Contract'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}