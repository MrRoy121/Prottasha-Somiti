import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LastRepaymentInfo.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanRepaymentWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/RepaymentLoanInfo.dart';

import '../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../Model/loanDisbursement.dart';
import '../../Model/loanSanction.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../route.dart';
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
  var conpayfineamount = TextEditingController();
  DateTime selectedfineDate = DateTime.now();
  var selectedsomiti;
  var sselectedsomiti;
  var selectedmemberss;
  var sselectedmemberss;
  var disbursed;
  var ssscheme;
  int sl = 0;
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
              membertype: element["Member Type"],dead: element['Dead'],
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
      double principle = 0, interest = 0, expireinterest = 0;
      double x = 0, y = 0, z = 0;

      await FirebaseFirestore.instance
          .collection('LoanDisbursed')
          .get()
          .then((querySnapshot) async {
        for (var json in querySnapshot.docs) {
          if (json['Member ID'] == selectedmemberss.id && json["Status"]) {
            disbursed = loanDisbursement(
              somiteename: json['Somitee Name'],
              somiteeid: json['Somitee ID'],
              approve: json["Approve"],deathriskamount: json["Death Risk Amount"],
              lst: loanSanction.fromJson(json['Sanction']),
              membername: json['Member Name'],approvedby: json["Approved By"],requestedby: json["Requested By"],
              disbursedate: json["Disbursed Date"].toDate(),
              memberid: json['Member ID'],
              disburseamount: json["Disbursed Amount"],
              narration: json["Narration"],
              approvedate: json["Approve Date"].toDate(),
              pincode: json["Pin Code"],
              status: json["Status"],
              id: json.id,
              sl: json['SL'],
            );

            await FirebaseFirestore.instance
                .collection('LoanRepaymentFine')
                .get()
                .then((querySnapshot) {
              for (var json in querySnapshot.docs) {
                if(json['Member ID'] == selectedmemberss.id &&
                    json['Sanction Id'] == disbursed.lst.id){
                  expireinterest = expireinterest + json['Fine Amount'];
                }
              }
            });

            await FirebaseFirestore.instance
                .collection('LoanRepayment')
                .where("Status", isEqualTo: true)
                .orderBy('Approve Date', descending: false)
                .get()
                .then((value) {
              int i = 1;
              if (value.docs.isNotEmpty) {
                for (var jsn in value.docs) {
                  available = true;
                  if (jsn['Member ID'] == selectedmemberss.id &&
                      jsn['Sanction Id'] == disbursed.lst.id) {
                    sl = sl + 1;
                    x = double.parse(jsn['Disbursed Amount'].toString()) *
                        (double.parse(jsn['Service Charge'].toString()) / 100);
                    y = x / double.parse(jsn['No Of Installment'].toString());
                    z = jsn['Pay Amount'] - y;
                    interest = interest + y;
                    principle = principle + z;
                    totalpaidamount = jsn['Pay Amount'] + totalpaidamount;
                  }
                  if (value.size == i) {
                    lastrepaymentdate = jsn['Approve Date'].toDate();
                    lastpaidamount = jsn['Pay Amount'];
                    principle = jsn['Disbursed Amount'] - principle;
                    amountclosestring =
                        "Principle : ${principle.toStringAsFixed(2)}/-,\nService Charge : ${(x - interest).toStringAsFixed(2)}/-\nExpire Interest : ${(expireinterest).toStringAsFixed(2)}/-";
                    amount = principle + x + expireinterest;
                    setState(() {});
                  }
                  i++;
                }
              } else {
                x = double.parse(disbursed.disburseamount.toString()) *
                    (double.parse(disbursed.lst.servicecharge.toString()) /
                        100);
                amountclosestring =
                    "Principle : ${json['Disbursed Amount']}/-\nService Charge : ${x}/-\nExpire Interest : 0/-";
                amount = json['Disbursed Amount'] + x;
                setState(() {});
              }
            });
            memberupdated = true;
            ssscheme = LoanSchemes.firstWhere(
                (element) => element.name == disbursed.lst.scheme);
            conpayamount.text = ssscheme.installmentamount.toString();
            setState(() {});
          }
        }
      });
    }

    void _onsubmit() {
      if (selectedsomiti == null ||
          selectedmemberss == null ||
          conpayamount.text == "" ||
          disbursed == null) {
        Get.snackbar(
            "Load Repayment Request Failed.", "Some Required Fields are Empty",
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
        const _chars = '1234567890';
        Random _rnd = Random();
        String getRandomString(int length) =>
            String.fromCharCodes(Iterable.generate(
                length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
        String id = getRandomString(8);
        FirebaseFirestore.instance.collection('LoanRepayment').doc(id).set({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          "Status": false,
          "Approve": false,'ID':id,
          'Member Name':
              selectedmemberss.firstname + " " + selectedmemberss.lastname,
          'Member ID': selectedmemberss.id,
          "Disbursed Amount": disbursed.disburseamount,
          'Approve Date': DateTime.now(),
          'Request Date': DateTime.now(),
          'Pay Amount': double.parse(conpayamount.text),
          'Sanction Id': disbursed.lst.id,
          'Service Charge': disbursed.lst.servicecharge,
          'No Of Installment': disbursed.lst.installmentno,
          'Narration': connarrarion.text,
          'Amount Close': amountclosestring,
          'Amount': amount,
          'SL': sl + 1,
        }).then((value) async {
          Get.offNamed(repaymentrequestlistPageRoute);
          Get.snackbar("Loan Repayment Request Added Successfully.",
              "Redirecting to Loan Repayment Request List Page.",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.green,
              margin: EdgeInsets.zero,
              duration: const Duration(milliseconds: 2000),
              boxShadows: [
                const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-100, 0),
                    blurRadius: 20),
              ],
              borderRadius: 0);
        }).catchError((error) => print("Failed to add user: $error"));
      }
    }

    void _onclear() {
      var vs;
      selectedsomiti = vs;
      memberselection = false;
      memberss = [];
      selectedmemberss = vs;
      disbursed = vs;
      amountclosestring = "";
      amount = 0;
      memberupdated = false;
      available = false;
      ssscheme = vs;
      conpayamount.text = '';
      connarrarion.text = "Loan Repayment";
      setState(() {});
    }

    void _onfine() {
      double fine = 0;
      Duration difference = DateTime.now().difference(disbursed.disbursedate);
      int differenceInDays = difference.inDays;
      print(differenceInDays);
      print(ssscheme.duration);
      if (differenceInDays < ssscheme.duration) {
        fine = amount*0.01;
      } else {
        fine = amount*0.02;
      }
      setState(() {
        conpayfineamount.text = fine.toString();
      });

      if (selectedsomiti == null || selectedmemberss == null) {
        Get.snackbar("Load Repayment Penulty Failed.",
            "Some Somitee and Member has to be selected.",
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
        Get.dialog(
            barrierColor: Colors.transparent,
            barrierDismissible: false,
            Dialog(
              backgroundColor: Colors.white,
              elevation: 20,
              alignment: Alignment.center,
              child: Container(
                width: 500,
                height: 400,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Add Penulty To",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      selectedmemberss.firstname +
                          " " +
                          selectedmemberss.lastname +
                          " -" +
                          selectedmemberss.id,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Transaction Date :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                          width: 300,
                          height: 120,
                          child: DefaultTextStyle.merge(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            child: CupertinoDatePicker(
                              initialDateTime: selectedfineDate,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() {
                                  selectedfineDate = newDate;
                                });
                              },
                              maximumDate: DateTime.now(),
                              mode: CupertinoDatePickerMode.date,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Fine Amount :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: conpayfineamount,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Amount",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 0,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            color: Colors.redAccent,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Cancel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                            if(conpayfineamount.text == ''){
                              Get.snackbar("Load Repayment Penulty Failed.",
                                  "Fine Amount Cannot be empty.",
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
                            }else{
                              FirebaseFirestore.instance.collection('LoanRepaymentFine').add({
                                'Member ID': selectedmemberss.id,
                                'Fine Date': DateTime.now(),
                                'Fine Amount': double.parse(conpayfineamount.text),
                                'Sanction Id': disbursed.lst.id,
                              }).then((value) async {
                                Get.offNamed(repaymentrequestlistPageRoute);
                                Get.snackbar("Loan Repayment Fine Added Successfully.",
                                    "Redirecting to Loan Repayment Request List Page.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                    margin: EdgeInsets.zero,
                                    duration: const Duration(milliseconds: 2000),
                                    boxShadows: [
                                      const BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(-100, 0),
                                          blurRadius: 20),
                                    ],
                                    borderRadius: 0);
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            color: Colors.green,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Save",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      }
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
                  SizedBox(
                    height: 50,
                  ),

                  // Loan Disbursement Details
                  LoanDetailsWidget(
                    title: 'Loan Repayment Details',
                    onsubmit: _onsubmit,
                    showfine: true,
                    onclear: _onclear,
                    onfine: _onfine,
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
                      amount: amount,
                      available: available,
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
