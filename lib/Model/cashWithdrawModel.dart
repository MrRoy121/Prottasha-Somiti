class CashWithdrawModel {
  String membername,
      memberid,
      requestedby,
      approvedby,
      id,
      accountno,
      chequeno,
      chequeseries,
      amountinword,
      remarks;
  bool status, approve;
  double withdrawamount, disburse;
  DateTime requestdate, approvedate, chequedate;
  int sl;

  CashWithdrawModel({
    required this.chequeseries,
    required this.chequeno,
    required this.chequedate,
    required this.membername,
    required this.remarks,
    required this.memberid,
    required this.accountno,
    required this.approvedate,
    required this.requestedby,
    required this.approvedby,
    required this.status,
    required this.approve,
    required this.withdrawamount,
    required this.disburse,
    required this.amountinword,
    required this.id,
    required this.requestdate,
    required this.sl,
  });
}
