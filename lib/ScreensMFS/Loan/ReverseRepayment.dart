import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LedgerTransactionSelection.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import '../../Model/loanRepayment.dart';
import '../../Model/somitee.dart';
import '../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/SamiteeSelection.dart';

class ReverseRepayment extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  ReverseRepayment({required this.appbool, required this.navbool});

  @override
  State<ReverseRepayment> createState() => _ReverseRepaymentState();
}

class _ReverseRepaymentState extends State<ReverseRepayment> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<loanRepayment> loansepayment = [];
  List<String> ssloansepayment = [];
  var selectedsomiti;
  var sselectedsomiti;
  var selectedloanrepay;
  var selectedloanrepayid;
  var condocumentno = TextEditingController();
  var conremarks = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
            closed: element["Closed"],
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      sselectedsomiti = ss;
      loansepayment = [];
      ssloansepayment = [];
      selectedsomiti = ss;
      sselectedsomiti;
      selectedloanrepay = ss;
      selectedloanrepayid = ss;
    });
  }

  void _onsubmit() {
    if (selectedsomiti == null || selectedloanrepay == null) {
      Get.snackbar("Load Repayment Reverse Request Failed.",
          "Some Required Fields are Empty",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: EdgeInsets.zero,
          duration: const Duration(milliseconds: 2000),
          boxShadows: [
            const BoxShadow(
                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
          ],
          borderRadius: 0);
    } else {
      FirebaseFirestore.instance
          .collection('LoanRepaymentReverse')
          .doc(selectedloanrepay.id)
          .set({
        'Somitee Name': selectedsomiti.name,
        'Somitee ID': selectedsomiti.id,
        "Approve": false,
        'ID': selectedloanrepay.id,
        'Member Name': selectedloanrepay.membername,
        'Member ID': selectedloanrepay.memberid,
        "Disbursed Amount": selectedloanrepay.disbursedamount,
        'Approve Date': DateTime.now(),
        'Repayment Date': selectedloanrepay.approvedate,
        'Pay Amount': selectedloanrepay.payamount,
        'Sanction Id': selectedloanrepay.sanctionid,
        'Amount Close': selectedloanrepay.amountclose,
        'Amount': selectedloanrepay.amount,
      }).then((value) async {
        Get.offNamed(repaymentreverseListPageRoute);
        Get.snackbar("Loan Repayment Reverse Request Added Successfully.",
            "Redirecting to Loan Repayment Request List Page.",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              const BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      }).catchError((error) => print("Failed to add user: $error"));
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _setupsomiti(int ins) async {
      selectedsomiti = somitee[ins];
      await FirebaseFirestore.instance
          .collection('LoanRepayment')
          .orderBy('Approve Date', descending: true)
          .get()
          .then((querySnapshot) {
        for (var json in querySnapshot.docs) {
          if (json['Somitee ID'] == selectedsomiti.id &&
              json["Status"] == true) {
            ssloansepayment.add(json['ID']);
            loansepayment.add(loanRepayment(
                somiteename: json['Somitee Name'],
                somiteeid: json['Somitee ID'],
                membername: json['Member Name'],
                id: json['ID'],
                approve: json['Approve'],
                memberid: json['Member ID'],
                disbursedamount: json["Disbursed Amount"],
                requestdate: json['Request Date'].toDate(),
                payamount: json['Pay Amount'],
                sanctionid: json['Sanction Id'],
                narration: json['Narration'],
                amountclose: json['Amount Close'],
                amount: json['Amount'],
                sl: json['SL'],
                status: json["Status"],
                approvedate: json["Approve Date"].toDate()));
          }
        }
      });
    }

    void _setuploanrepay(int ins) {
      setState(() {
        selectedloanrepay = loansepayment[ins];
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
                  // Loan Disbursement Details
                  LoanDetailsWidget(
                    title: 'Reverse Repayment',
                    onsubmit: _onsubmit,
                    onclear: _onclear,
                    onfine: () {},
                    showfine: false,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  SamiteeSelection(
                      submit: false,
                      selectmember: false,
                      clear: false,
                      ssomitee: ssomitee,
                      close: false,
                      setupsomiti: _setupsomiti,
                      active: false,
                      selectedsomiteeid: selectedsomiti,
                      onsubmit: () {},
                      somitee: somitee,
                      onclear: _onclear,
                      selectedsomitee: sselectedsomiti),

                  SizedBox(
                    height: 30,
                  ),

                  LedgerTrasactionSelection(
                    loanrepay: loansepayment,
                    ssloanrepay: ssloansepayment,
                    conremarks: conremarks,
                    condocumentno: condocumentno,
                    setuploanrepay: _setuploanrepay,
                    selectedloanrepay: selectedloanrepay,
                    selectedloanrepayid: selectedloanrepayid,
                  ),

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
