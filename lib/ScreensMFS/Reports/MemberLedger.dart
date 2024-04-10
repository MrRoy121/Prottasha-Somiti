import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../Model/Itemvaluess.dart';
import '../../Model/member.dart';
import '../../Model/reportModel.dart';
import '../../helpers/pdfs_helpers/pdf_memberdepositledger.dart';
import '../../helpers/pdfs_helpers/pdf_memberloanledger.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/Ledger.dart';
import 'package:get/get.dart';

class MemberLedger extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberLedger({required this.appbool, required this.navbool});

  @override
  State<MemberLedger> createState() => _MemberLedgerState();
}

class _MemberLedgerState extends State<MemberLedger> {
  List<Memberss> memberss = [];
  var selectedledgertype;
  var selectedmemberss;
  var balancelist = [];
  double _totalamount = 0;
  var selectedStatus;
  var sselectedmemberss;
  DateTime selectedstartDate = DateTime.now();
  DateTime selectedendDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Member')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["Status"]) {
          memberss.add(Memberss(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              occupation: element["Occupation"],
              firstname: element["First Name"],
              dead: element['Dead'],
              lastname: element["Last Name"],
              fathername: element["Father Name"],
              mothername: element["Mother Name"],
              gender: element["Gender"],
              religion: element["Religion"],
              nationalid: element["National ID"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
              sts: element["Status"],
              age: element["Age"],
              education: element["Education"],
              maritalstatus: element["Marital Status"],
              mobilenotype: element["Mobile No Type"],
              mobilenno: element["Mobile No"],
              presentadd: element["Present Address"],
              parmaadd: element["Permanent Address"],
              livingperiod: element["Living Period"],
              nomaleearner: element["No Female Earner"],
              nofemaleearner: element["No Male Earner"],
              id: element.id,
              headfamily: element["Head Family"],
              ownhomestead: element["Own HomeStead"],
              relationwithhead: element["Relation With Head"],
              landdesc: element["Land Desc"],
              remarks: element["Remarks"],
              imageurl: element["ImageURL"],
              img: element["Image"],
              birthdate: element["Date Of Birth"].toDate(),
              sl: 0));
        }
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedmemberss = ss;
      selectedledgertype = ss;
      sselectedmemberss = ss;
      selectedstartDate = DateTime.now();
      selectedendDate = DateTime.now();
    });
  }

  Future<List<Itemvaluess>> getdepositlist() async {
    List<Itemvaluess> itemvaluess = [];
    _totalamount = 0;
    balancelist = [];

    DateTime startDateTime = DateTime(
        selectedstartDate.year, selectedstartDate.month, selectedstartDate.day);
    DateTime endDateTime = DateTime(selectedendDate.year, selectedendDate.month,
        selectedendDate.day, 23, 59, 59, 999);

    await FirebaseFirestore.instance
        .collection('Member')
        .doc(selectedmemberss.id)
        .get()
        .then((element) {
      if (element["Status"]) {
        int s = 0;
        for (int i = 0; i < element["Deposits"].length; i++) {
          DateTime depositDate =
              DateTime.parse(element["Deposits"][i]['date']).toLocal();

          if (depositDate.isAfter(startDateTime) &&
                  depositDate.isBefore(endDateTime) ||
              depositDate == startDateTime ||
              depositDate == endDateTime) {
            itemvaluess.add(Itemvaluess(
                sl: s,
                date: element["Deposits"][i]['date'],
                value: element["Deposits"][i]['value'],
                remarks: element["Deposits"][i]['remarks']));
            _totalamount += element["Deposits"][i]['value'];
            if (balancelist.isEmpty) {
              balancelist.add(element["Deposits"][i]['value']);
            } else {
              balancelist.add(element["Deposits"][i]['value'] +
                  balancelist[balancelist.length - 1]);
            }
            s++;
          }
        }
      }
    });
    return itemvaluess;
  }

  Future<List<ReportModel>> getloanlist() async {
    List<ReportModel> itemvaluess = [];double servicecharge = 0;
    _totalamount = 0;
    String sanctionid = '';
    int i = 0;
    await FirebaseFirestore.instance
        .collection('LoanDisbursed')
        .where('Member ID', isEqualTo: selectedmemberss.id)
        .orderBy('Disbursed Date', descending: true)
        .limit(1)
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        sanctionid =json['Sanction']["ID"];
        itemvaluess.add(
          ReportModel(
            naration: "Loan Disbursement",
            balance: -json["Disbursed Amount"],
            credit: 0,
            debit: json["Disbursed Amount"],
            documentno: "TR0001",
            transactiondate: json["Disbursed Date"].toDate(),
          ),
        );
        servicecharge =(json['Sanction']["Service Charge"]/100);
        itemvaluess.add(
          ReportModel(
            naration: "Service Charges Charged",
            balance: itemvaluess.last.balance - (json["Disbursed Amount"] *  servicecharge),
            credit: 0,
            debit:json["Disbursed Amount"] *  servicecharge,
            documentno: "TR0002",
            transactiondate: json["Disbursed Date"].toDate(),
          ),
        );
        i++;i++;
      }
    });
    await FirebaseFirestore.instance
        .collection('LoanRepayment')
        .orderBy('Approve Date', descending: false)
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        if(json["Status"]&&json['Approve']&&json['Sanction Id']==sanctionid){
          double aaa = json['Pay Amount']* servicecharge;
          itemvaluess.add(
            ReportModel(
              naration: "Service Charge Adjustment",
              balance: itemvaluess.last.balance + (aaa),
              credit: aaa,
              debit: 0,
              documentno: "TR00$i",
              transactiondate: json["Approve Date"].toDate(),
            ),
          );
          i++;
          itemvaluess.add(
            ReportModel(
              naration: "Loan Amount Adjustment",
              balance: itemvaluess.last.balance + (json['Pay Amount']-aaa),
              credit: json['Pay Amount']-aaa,
              debit: 0,
              documentno: "TR00$i",
              transactiondate: json["Approve Date"].toDate(),
            ),
          );
          i++;i++;
        }
      }
    });

    await FirebaseFirestore.instance
        .collection('LoanRepaymentFine')
        .orderBy('Fine Date', descending: false)
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        if(json['Sanction Id']==sanctionid){
          itemvaluess.add(
            ReportModel(
              naration: "Late Payment Fine Adjustment",
              balance: itemvaluess.last.balance - (json['Fine Amount']),
              credit: 0,
              debit: json['Fine Amount'],
              documentno: "TR00$i",
              transactiondate: json["Fine Date"].toDate(),
            ),
          );
          i++;
        }
      }
    });
    itemvaluess.sort((a, b) => a.transactiondate.compareTo(b.transactiondate));
    return itemvaluess;
  }

  _save() async {
    if (selectedmemberss == null ||
        selectedledgertype == null ||
        selectedStatus == null) {
      Get.snackbar("Member Ledger Report Generation Failed.",
          "Some Required Fields are Empty",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: EdgeInsets.zero,
          duration: const Duration(milliseconds: 2000),
          boxShadows: [
            BoxShadow(
                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
          ],
          borderRadius: 0);
    } else {
      if (selectedledgertype == LedgerTypeList[0]) {
        PdfMemberssDepositLedger.generate(
            await getdepositlist(),
            _totalamount,
            balancelist,
            selectedmemberss.id,
            "${selectedmemberss.firstname} ${selectedmemberss.lastname}",
            selectedledgertype,
            selectedStatus == 'yes' ? "Active" : "Closed",
            selectedstartDate,
            selectedendDate);
      } else {
        PdfMemberssLoanLedger.generate(
            await getloanlist(),
            selectedmemberss.id,
            "${selectedmemberss.firstname} ${selectedmemberss.lastname}",
            selectedledgertype,
            selectedStatus == 'yes' ? "Active" : "Closed",);

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    void _setupledgertype(int ins) {
      setState(() {
        selectedledgertype = LedgerTypeList[ins];
      });
    }

    void _changestatus(String val) {
      setState(() {
        selectedStatus = val;
      });
    }

    Future<void> _selectstartDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedstartDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedstartDate) {
        setState(() {
          selectedstartDate = picked;
        });
      }
    }

    Future<void> _selectendDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedendDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedendDate) {
        setState(() {
          selectedendDate = picked;
        });
      }
    }

    void _setupmemberss(int ins) {
      setState(() {
        selectedmemberss = memberss[ins];
      });
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: [
                  Ledger(
                    selectedstartDate: selectedstartDate,
                    selectstartDate: _selectstartDate,
                    selectedendDate: selectedendDate,
                    selectendDate: _selectendDate,
                    onsubmit: _save,
                    changestatus: _changestatus,
                    setupmemberss: _setupmemberss,
                    selectedmemberssid: sselectedmemberss,
                    selectedmemberss: selectedmemberss,
                    selectedStatus: selectedStatus,
                    onclear: _onclear,
                    memberss: memberss,
                    selectedledgertype: selectedledgertype,
                    setupledgertype: _setupledgertype,
                  ),
                ],
              ),
            ),
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
