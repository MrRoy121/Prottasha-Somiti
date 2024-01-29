import 'loanSanction.dart';

class loanDisbursement {
  loanSanction lst;
  String somiteename,
      somiteeid,
      membername,
      memberid,
      id,
      manegername,
      pincode,
      status,
      narration;
  double disburseamount;
  DateTime disbursedate, approvedate;
  int sl;

  loanDisbursement({
    required this.lst,
    required this.somiteename,
    required this.somiteeid,
    required this.membername,
    required this.memberid,
    required this.approvedate,
    required this.manegername,
    required this.pincode,
    required this.status,
    required this.narration,
    required this.disburseamount,
    required this.id,
    required this.disbursedate,
    required this.sl,
  });

  Map toJson() => {
        'Somitee Name': somiteename,
        'Somitee ID': somiteeid,
        'Member Name': membername,
        'Member ID': memberid,
        'Sanction': lst.toJson(),
        'SL': sl,
        'Disbursed Amount': disburseamount,
        'Pin Code': pincode,
        'Disbursed Date': disbursedate,
        'Approve Date': approvedate,
        'Manager Name': membername,
        'Status': status,
        'Narration': narration,
      };
  bool filterFn(String query) {
    return id.toLowerCase().contains(query.toLowerCase());
  }

  factory loanDisbursement.fromJson(Map<String, dynamic> json) {
    return loanDisbursement(
        somiteename: json['Somitee Name'],
        somiteeid: json['Somitee ID'],
        lst: loanSanction.fromJson(json['Sanction']),
        membername: json['Member Name'],disbursedate: json["Disbursed Date"],
        memberid: json['Member ID'],disburseamount: json["Disbursed Amount"],narration: json["Narration"],
        approvedate: json["Approve Date"],manegername: json["Manager Name"],pincode: json["Pin Code"],
        status: json["Status"],
        id: json['ID'],
        sl: json['sl']);
  }
}
