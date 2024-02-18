class DepositRequest {
  double value;
  String remarks,date,memberid;
  int sl;

  DepositRequest({required this.date,required this.memberid, required this.sl,required this.value, required this.remarks});

  Map<String, dynamic> toMap() {
    return {
      'Date': date,
      'Value': value,
      'Remarks': remarks,
      'Member ID': memberid,
    };
  }
}