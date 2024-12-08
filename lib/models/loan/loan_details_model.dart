// loan_details_model.dart
class LoanDetails {
  final double loanAmount;
  final String loanDate;
  final double amountLeft;
  final double totalPaid;
  final double monthlyPayment;
  final int loanPeriod;
  final double rate;
  final String finishDate;

  LoanDetails({
    required this.loanAmount,
    required this.loanDate,
    required this.amountLeft,
    required this.totalPaid,
    required this.monthlyPayment,
    required this.loanPeriod,
    required this.rate,
    required this.finishDate,
  });
}
