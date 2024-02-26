class DailyTransactionModel {
  String naration, transacno, acno, actitle;
  DateTime transactiondate;
  double amount;
  bool drcr;

  DailyTransactionModel(
      {required this.amount,
      required this.transacno,
      required this.drcr,
      required this.acno,
      required this.actitle,
      required this.naration,
      required this.transactiondate});
}
