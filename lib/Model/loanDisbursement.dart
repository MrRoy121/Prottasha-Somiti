import 'loanSanction.dart';

class loanDisbursement {
  loanSanction lst;
  String somiteename,
      somiteeid,
      membername,
      memberid,requestedby, approvedby,
      id,
      pincode,
      narration;
  bool status, approve;
  double disburseamount, deathriskamount;
  DateTime disbursedate, approvedate;
  int sl;

  loanDisbursement({
    required this.lst,
    required this.somiteename,
    required this.somiteeid,
    required this.membername,required this.deathriskamount,
    required this.memberid,
    required this.approvedate,required this.requestedby, required this.approvedby,
    required this.pincode,
    required this.status,
    required this.approve,
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
    "Approve": approve,
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
        somiteename: json['Somitee Name'],deathriskamount: json["Death Risk Amount"],
        somiteeid: json['Somitee ID'],approve: json["Approve"],approvedby: json["Approved By"],requestedby: json["Requested By"],
        lst: loanSanction.fromJson(Map<String, dynamic>.from(json['Sanction'])),
        membername: json['Member Name'],disbursedate: json["Disbursed Date"].toDate(),
        memberid: json['Member ID'],disburseamount: json["Disbursed Amount"],narration: json["Narration"],
        approvedate: json["Approve Date"].toDate(),pincode: json["Pin Code"],
        status: json["Status"],
        id: json['ID'],
        sl: json['sl']);
  }
}
