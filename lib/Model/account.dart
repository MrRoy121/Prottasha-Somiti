import 'loanSanction.dart';
import 'member.dart';

class Accountss {
  Map member;
  String nomineeimage,
      docmentfront,
      documentback,
      requestedby,
      approvedby,
      documentno,
      documenttype,
      introducerno,
      introducertype,
      introducername,
      accounttype,
      sector,
      id,
      relation,
      nomineename,
      fathername,
      mothername,
      nomineepercentage;
  DateTime dateofbirth;
  bool status, approve;
  DateTime requestdate, approvedate;
  int sl;

  Accountss(
      {required this.nomineeimage,
      required this.member,
      required this.docmentfront,
      required this.documentback,
      required this.documentno,
      required this.documenttype,
      required this.approvedate,
      required this.introducerno,
      required this.requestedby,
      required this.approvedby,
      required this.introducertype,
      required this.status,
      required this.approve,
      required this.nomineename,
      required this.fathername,
      required this.mothername,
      required this.nomineepercentage,
      required this.id,
      required this.requestdate,
      required this.sl,
      required this.accounttype,
      required this.dateofbirth,
      required this.introducername,
      required this.relation,
      required this.sector});
}
