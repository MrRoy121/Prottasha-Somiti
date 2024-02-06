class loanRepayment {
  String somiteename,
      somiteeid,
      membername,
      memberid,
      sanctionid,
      id,
      narration,
      amountclose;
  bool status, approve;
  double amount, payamount, disbursedamount;
  DateTime requestdate, approvedate;
  int sl;

  loanRepayment(
      {required this.somiteename,
      required this.somiteeid,
      required this.requestdate,
      required this.membername,
      required this.id,
      required this.memberid,
      required this.approve,
      required this.approvedate,
      required this.amount,
      required this.amountclose,
      required this.disbursedamount,
      required this.status,
      required this.narration,
      required this.payamount,
      required this.sanctionid,
      required this.sl});

  bool filterFn(String query) {
    return id.toLowerCase().contains(query.toLowerCase());
  }

  Map toJson() => {
        'Somitee Name': somiteename,
        'Somitee ID': somiteeid,
        'Member Name': membername,
        'Member ID': memberid,
        "Approve Date": approvedate,
        "Disbursed Amount": disbursedamount,
        'Request Date': requestdate,
        'Pay Amount': payamount,
        'Sanction Id': sanctionid,
        'Approve': approve,
        'ID': id,
        'Narration': narration,
        'Amount Close': amountclose,
        'Amount': amount,
        'SL': sl,
        "Status": status,
      };

  factory loanRepayment.fromJson(Map<String, dynamic> json) {
    return loanRepayment(
        somiteename: json['Somitee Name'],
        somiteeid: json['Somitee ID'],
        membername: json['Member Name'],
        approve: json['Approve'],
        memberid: json['Member ID'],
        id: json['ID'],
        disbursedamount: json["Disbursed Amount"],
        requestdate: json['Request Date'].toDate(),
        payamount: json['Pay Amount'],
        sanctionid: json['Sanction Id'],
        narration: json['Narration'],
        amountclose: json['Amount Close'],
        amount: json['Amount'],
        sl: json['SL'],
        status: json["Status"],
        approvedate: json["Approve Date"].toDate());
  }
}
