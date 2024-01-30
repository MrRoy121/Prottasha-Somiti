import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LastRepaymentInfo.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanRepaymentWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/RepaymentLoanInfo.dart';

import '../../Constants/values.dart';
import '../../Model/loanDisbursement.dart';
import '../../Model/loanSanction.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class RepaymentRequest extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  RepaymentRequest({required this.appbool, required this.navbool});

  @override
  State<RepaymentRequest> createState() => _RepaymentRequestState();
}

class _RepaymentRequestState extends State<RepaymentRequest> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<Memberss> allmemberss = [];
  List<Memberss> memberss = [];
  bool memberselection = false;
  bool memberupdated = false;
  bool available = false;
  var connarrarion = TextEditingController(text: "Loan Repayment");
  var conpayamount = TextEditingController();
  var selectedsomiti;
  var sselectedsomiti;
  var selectedmemberss;
  var sselectedmemberss;
  var disbursed;
  var ssscheme;
  String amountclosestring = '';
  double totalpaidamount = 0, lastpaidamount = 0, amount = 0;
  DateTime lastrepaymentdate = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Somitee')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            name: element["Name"],
            active: element["Active"],
            closed: element["Closed"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
    await FirebaseFirestore.instance
        .collection('Member')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["Status"]) {
          allmemberss.add(Memberss(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              occupation: element["Occupation"],
              firstname: element["First Name"],
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
              nodepenndent: element["No of Dependent"],
              education: element["Education"],
              maritalstatus: element["Marital Status"],
              mobilenotype: element["Mobile No Type"],
              mobilenno: element["Mobile No"],
              presentadd: element["Present Address"],
              parmaadd: element["Parmanent Address"],
              livingperiod: element["Living Period"],
              nomaleearner: element["No Female Earner"],
              nofemaleearner: element["No Male Earner"],
              id: element.id,
              headfamily: element["Head Family"],
              ownhomestead: element["Own HomeStead"],
              relationwithhead: element["Relation With Head"],
              landdesc: element["Land Desc"],
              housedesc: element["House Desc"],
              remarks: element["Remarks"],
              imageurl: element["ImageURL"],
              img: element["Image"],
              birthdate: element["Date Of Birth"].toDate(),
              sl: 0));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
        memberselection = true;
        memberss = allmemberss
            .where((member) => member.somiteeid == somitee[ins].id)
            .toList();
      });
    }

    Future<void> _setupmemberss(int ins) async {
      selectedmemberss = memberss[ins];
      await FirebaseFirestore.instance
          .collection('LoanDisbursed')
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          if (json['Member ID'] == selectedmemberss.id) {
            disbursed = loanDisbursement(
              somiteename: json['Somitee Name'],
              somiteeid: json['Somitee ID'],
              lst: loanSanction.fromJson(json['Sanction']),
              membername: json['Member Name'],
              disbursedate: json["Disbursed Date"].toDate(),
              memberid: json['Member ID'],
              disburseamount: json["Disbursed Amount"],
              narration: json["Narration"],
              approvedate: json["Approve Date"].toDate(),
              manegername: json["Manager Name"],
              pincode: json["Pin Code"],
              status: json["Status"],
              id: json.id,
              sl: json['SL'],
            );
            available = true;
            memberupdated = true;
            ssscheme = LoanSchemes.firstWhere(
                (element) => element.name == disbursed.lst.scheme);
            conpayamount.text = ssscheme.installmentamount.toString();
            setState(() {});
          }
        }
      });
    }

    void _onsubmit() {}

    void _onclear() {}

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
                  SizedBox(
                    height: 50,
                  ),

                  // Loan Disbursement Details
                  LoanDetailsWidget(
                    title: 'Loan Repayment Details',
                    onsubmit: _onsubmit,
                    onclear: _onclear,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Loan repayment
                  LoanRepaymentWidget(
                      ssomitee: ssomitee,
                      connarrarion: connarrarion,
                      conpayamount: conpayamount,
                      setupsomiti: _setupsomiti,
                      selectedsomiteeid: selectedsomiti,
                      allmemberss: allmemberss,
                      setupmemberss: _setupmemberss,
                      memberssselected: memberselection,
                      selectedmemberssid: sselectedmemberss,
                      somitee: somitee,
                      selectedmemberss: selectedmemberss,
                      memberss: memberss,
                      selectedsomitee: sselectedsomiti),

                  SizedBox(
                    height: 30,
                  ),

                  // Loan imformation
                  RepaymentLoanINfo(
                      disbursed: disbursed,
                      memberselection: memberupdated,
                      sscheme: ssscheme),

                  SizedBox(
                    height: 30,
                  ),

                  // Last Repayment Information
                  LastRepaymentInfo(
                      totalpaidamount: totalpaidamount,
                      amount: amount,available: available,
                      amountclosestring: amountclosestring,
                      lastpaidamount: lastpaidamount,
                      lastrepaymentdate: lastrepaymentdate),

                  SizedBox(
                    height: 50,
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
