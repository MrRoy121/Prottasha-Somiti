import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDeposit.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/SamiteeSelection.dart';

class DepositCorrectionRequest extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCorrectionRequest({required this.appbool, required this.navbool});

  @override
  State<DepositCorrectionRequest> createState() =>
      _DepositCorrectionRequestState();
}

class _DepositCorrectionRequestState extends State<DepositCorrectionRequest> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;
  List<Memberss> allmemberss = [];
  List<Memberss> memberss = [];
  bool memberselection = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedDate;
  double mainamount =0;
  var conremarks = TextEditingController();
  var conamount = TextEditingController();
  var selectreverce = "Full Reverse";
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
    int s = 1;
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Member').get();
      for (var element in querySnapshot.docs) {
        if (element["Deposits"].toString() != 'null') {
          var deposits = element["Deposits"];
          allmemberss.add(Memberss.withDepo(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              deposit: deposits,
              withdraw: [],
              occupation: element["Occupation"],
              firstname: element["First Name"],
              lastname: element["Last Name"],
              dead: element['Dead'],
              fathername: element["Father Name"],
              mothername: element["Mother Name"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
              gender: element["Gender"],
              religion: element["Religion"],
              sts: element["Status"],
              nationalid: element["National ID"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
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
              sl: s));
          s++;
          setState(() {});
        } else {
          allmemberss.add(Memberss.withDepo(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              deposit: [],
              withdraw: [],
              occupation: element["Occupation"],
              firstname: element["First Name"],
              lastname: element["Last Name"],
              dead: element['Dead'],
              fathername: element["Father Name"],
              mothername: element["Mother Name"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
              gender: element["Gender"],
              religion: element["Religion"],
              sts: element["Status"],
              nationalid: element["National ID"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
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
              sl: s));
          s++;
          setState(() {});
        }
      }
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      sselectedsomiti = ss;
      memberselection = false;
      selectedmemberss = ss;
      sselectedmemberss = ss;
      selectedDate = ss;
      conremarks = TextEditingController(text: '');
      conamount = TextEditingController(text: '');
      selectreverce = "Full Reverse";
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

    void _setupmemberss(int ins) {
      setState(() {
        selectedmemberss = memberss[ins];
      });
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        selectableDayPredicate: (DateTime day) {
          if (memberselection) {
            return selectedmemberss.deposit.any(
                  (entry) {
                DateTime depositDate = DateTime.parse(entry["date"]).toLocal();
                return day.year == depositDate.year &&
                    day.month == depositDate.month &&
                    day.day == depositDate.day;
              },
            );
          } else {
            return false;
          }
        },
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          var matchingDeposit = selectedmemberss.deposit.firstWhere(
                (entry) {
              DateTime depositDate = DateTime.parse(entry["date"]).toLocal();
              return picked.year == depositDate.year &&
                  picked.month == depositDate.month &&
                  picked.day == depositDate.day;
            },
            orElse: () => null,
          );
          if (matchingDeposit != null) {
            mainamount = matchingDeposit['value'];
            conamount.text = matchingDeposit['value'].toString();
          } else {
            conamount.clear();
          }
        });

      }
    }
    void _onsubmit() {
      print(selectedsomiti);
      print(selectedmemberss);
      print(selectedDate);
      print(conamount.text);
      if (selectedsomiti == null ||
          selectedmemberss == null ||
          selectedDate == null ||
          conamount.text == "") {
        Get.snackbar("Load Deposit Correction Request Failed.",
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
            .collection('DepositReverse')
            .doc(selectedDate.millisecondsSinceEpoch.toString())
            .set({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          "Status": false,
          'Date': selectedDate,
          "Approve": false,
          'ID': selectedDate.millisecondsSinceEpoch.toString(),
          'Member Name':
              selectedmemberss.firstname + " " + selectedmemberss.lastname,
          'Member ID': selectedmemberss.id,
          'Approve Date': DateTime.now(),
          'Main Amount': mainamount,
          'Request Date': DateTime.now(),
          'Amount': double.parse(conamount.text),
          'Reverse Type': selectreverce,
          'Remarks': conremarks.text,
        }).then((value) async {
          Get.offNamed(depositcorrectionrequestlistPageRoute);
          Get.snackbar("Deposit Correction Request Added Successfully.",
              "Redirecting to Deposit Correction Request List Page.",
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

                  SamiteeSelection(
                      submit: true,
                      selectmember: false,
                      clear: true,
                      ssomitee: ssomitee,
                      close: true,
                      setupsomiti: _setupsomiti,
                      active: true,
                      selectedsomiteeid: selectedsomiti,
                      onsubmit: _onsubmit,
                      somitee: somitee,
                      onclear: _onclear,
                      selectedsomitee: sselectedsomiti),

                  SizedBox(
                    height: 50,
                  ),

                  // MEMBER DEPOSIT CORRECTION
                  MemberDeposit(
                      allmemberss: allmemberss,selectDate: _selectDate,
                      setupmemberss: _setupmemberss,
                      mainamount: mainamount,
                      memberssselected: memberselection,
                      selectedDate: selectedDate,
                      conremarks: conremarks,
                      conamount: conamount,
                      selectreverce: selectreverce,
                      selectedmemberssid: sselectedmemberss,
                      selectedmemberss: selectedmemberss,
                      memberss: memberss),
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
