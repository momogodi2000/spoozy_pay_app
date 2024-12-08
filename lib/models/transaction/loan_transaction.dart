class Loan_page {
  final String borrower;
  final String lender;
  final double amount;
  final DateTime startDate;
  final DateTime dueDate;
  final String status; // Ongoing, Repaid, Overdue

  Loan_page({
    required this.borrower,
    required this.lender,
    required this.amount,
    required this.startDate,
    required this.dueDate,
    required this.status,
  });
}
