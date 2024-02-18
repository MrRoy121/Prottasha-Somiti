class DepositRequest {
  double value;
  String remarks, memberid, membername, user,id;
  int sl;
  DateTime date;

  DepositRequest(
      {required this.membername,
      required this.user,
      required this.date,
      required this.memberid,
      required this.sl,
        required this.id,
      required this.value,
      required this.remarks});

  Map<String, dynamic> toMap() {
    return {
      'Date': date,
      'Value': value,
      'Remarks': remarks,
      'Member ID': memberid,
      'Member Name': membername,
      'User': user,
    };
  }
}
