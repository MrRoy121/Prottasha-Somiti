class depositReverse {
  String somiteename,
      somiteeid,
      membername,
      memberid,
      remarks,
      reveersetype,
      id;
  double amount, mainamount;
  DateTime requestdate, approvedate, date;
  int sl;
  bool status, approve;

  depositReverse(
      {required this.somiteename,
      required this.somiteeid,
      required this.membername,
      required this.memberid,
      required this.approvedate,
      required this.remarks,
      required this.mainamount,
      required this.status,
      required this.id,
      required this.sl,
      required this.approve,
      required this.requestdate,
      required this.amount,
      required this.date,
      required this.reveersetype});

  Map toJson() => {
        'Somitee Name': somiteename,
        'Somitee ID': somiteeid,
        'Member Name': membername,
        'Member ID': memberid,
        "Status": status,
        'Date': date,
        "Approve": approve,
        'ID': id,
        'Approve Date': approvedate,
        'Main Amount': mainamount,
        'Request Date': requestdate,
        'Amount': amount,
        'Reverse Type': reveersetype,
        'Remarks': remarks,
      };
  bool filterFn(String query) {
    return id.toLowerCase().contains(query.toLowerCase());
  }

  factory depositReverse.fromJson(Map<String, dynamic> json) {
    return depositReverse(
      somiteename: json['Somitee Name'],
      somiteeid: json['Somitee ID'],
      mainamount: json['Main Amount'],
      requestdate: json['Request Date'],
      reveersetype: json['Reverse Type'],
      membername: json['Member Name'],
      amount: json['Amount'],
      approve: json['Approve'],
      date: json['Date'],
      memberid: json['Member ID'],
      approvedate: json["Approve Date"].toDate(),
      remarks: json["Remarks"],
      status: json["Status"],
      id: json['ID'],
      sl: json['sl'],
    );
  }
}
