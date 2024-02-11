class depositWithdraw {
  String somiteename, somiteeid, membername, memberid, remarks, withdrawtyp, id;
  double amount;
  DateTime requestdate, approvedate;
  int sl;
  bool status, approve;

  depositWithdraw(
      {required this.somiteename,
      required this.somiteeid,
      required this.membername,
      required this.memberid,
      required this.approvedate,
      required this.remarks,
      required this.status,
      required this.id,
      required this.sl,
      required this.approve,
      required this.requestdate,
      required this.amount,
      required this.withdrawtyp});

  Map toJson() => {
        'Somitee Name': somiteename,
        'Somitee ID': somiteeid,
        'Member Name': membername,
        'Member ID': memberid,
        "Status": status,
        "Approve": approve,
        'ID': id,
        'Approve Date': approvedate,
        'Request Date': requestdate,
        'Withdraw Amount': amount,
        'Withdraw Type': withdrawtyp,
        'Remarks': remarks,
      };
  bool filterFn(String query) {
    return id.toLowerCase().contains(query.toLowerCase());
  }

  factory depositWithdraw.fromJson(Map<String, dynamic> json) {
    return depositWithdraw(
      somiteename: json['Somitee Name'],
      somiteeid: json['Somitee ID'],
      requestdate: json['Request Date'],
      withdrawtyp: json['Withdraw Type'],
      membername: json['Member Name'],
      amount: json['Withdraw Amount'],
      approve: json['Approve'],
      memberid: json['Member ID'],
      approvedate: json["Approve Date"].toDate(),
      remarks: json["Remarks"],
      status: json["Status"],
      id: json['ID'],
      sl: json['sl'],
    );
  }
}
