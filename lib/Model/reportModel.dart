class ReportModel {
  String naration, documentno;
  DateTime transactiondate;
  double debit, credit, balance;

  ReportModel(
      {required this.balance,
      required this.credit,
      required this.debit,
      required this.documentno,
      required this.naration,
      required this.transactiondate});
}
