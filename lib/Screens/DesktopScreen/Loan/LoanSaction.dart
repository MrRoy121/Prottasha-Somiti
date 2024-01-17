import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/member.dart';
import 'package:get/get.dart';
import '../../../../Model/somitee.dart';
import '../../../../Widget/LoanWidgets/LoanGuarantor.dart';
import '../../../../Widget/LoanWidgets/LoanGuarantor_family.dart';
import '../../../../Widget/LoanWidgets/LoanSamitteSelection.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/TransactionWidget/MemberDeposit.dart';
import '../../../../route.dart';

class LoanSanction extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanSanction({required this.appbool, required this.navbool});

  @override
  State<LoanSanction> createState() => _LoanSanctionState();
}

class _LoanSanctionState extends State<LoanSanction> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<Memberss> allmemberss = [];
  List<Memberss> memberss = [];
  bool memberselection = false;
  var selectedsomiti;
  var selectedloanpurpose;
  var sselectedsomiti;
  var selectedmemberss;
  var sselectedmemberss;
  var _selectedinstalment;
  var _selectedloanperiod;
  DateTime selectedDate = DateTime.now();
  var selectedgrantor1;
  var selectedgrantor2;
  var congrname = TextEditingController();
  var congrfname = TextEditingController();
  var congrrelation = TextEditingController();
  var congrmobile = TextEditingController();
  var coninstallmentno = TextEditingController();
  var conremarks = TextEditingController();
  var coninstallmentamount = TextEditingController();
  var consanctionlimit = TextEditingController();
  var conservicecharge = TextEditingController();
  double serviceamount = 0;
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
            active: element["Active"],closed: element["Closed"],
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
            nationalid: element["National ID"],loanpendingamount: element["Loan Pending Amount"],owndepositamount: element["Own deposit Amount"],
            birthregi: element["Birth Registration"],
            annualincome: element["Annual Income"],
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
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      selectedsomiti = ss;
      selectedmemberss = ss;
      selectedgrantor1 = ss;
      selectedgrantor2 = ss;selectedloanpurpose = ss;
      _selectedinstalment = ss;
      _selectedloanperiod = ss;
      consanctionlimit.text = "";
      conservicecharge.text = "";
      coninstallmentno.text = "";
      coninstallmentamount.text = "";
      serviceamount = 0;
      conremarks.text = "";
      congrname.text = "";
      congrfname.text = "";
      congrrelation.text = "";
      congrmobile.text = "";
    });
  }

  void _save() async {
    const _chars = '1234567890';
    Random _rnd = Random();
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    String sanctionloanrequestid = getRandomString(8);
    if (selectedsomiti == null ||
        selectedmemberss == null ||
        selectedgrantor1 == null ||selectedloanpurpose == null||
        selectedgrantor2 == null ||
        consanctionlimit.text.isEmpty ||
        _selectedinstalment == null) {
      Get.snackbar(
          "Load Sanction Request Failed.", "Some Required Fields are Empty",
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
     FirebaseFirestore.instance
          .collection('LoanSanction')
          .doc(sanctionloanrequestid)
          .set({
        'Somitee Name': selectedsomiti.name,
        'Somitee ID': selectedsomiti.id,
        'Member Name':
            selectedmemberss.firstname + " " + selectedmemberss.lastname,
        'Member ID': selectedmemberss.id,
        'Member Phone': selectedmemberss.mobilenno,
        "Sanction Limit": double.parse(consanctionlimit.text),
        "Installment Frequency": _selectedinstalment,
        "Sanction Date": selectedDate,
       "Loan Purpose":selectedloanpurpose,
        "Loan Period": _selectedloanperiod,
        "Service Charge": double.parse(conservicecharge.text),
        "Installment No": double.parse(coninstallmentno.text),
        "Installment Amount":  double.parse(coninstallmentamount.text),
        "Remarks": conremarks.text,
        "Service Amount": serviceamount,
        'Grantor 1 Name':
            selectedgrantor1.firstname + " " + selectedgrantor1.lastname,
        'Grantor 1 ID': selectedgrantor1.id,
        'Grantor 2 Name':
            selectedgrantor2.firstname + " " + selectedgrantor2.lastname,
        'Grantor 2 ID': selectedgrantor2.id,
        "Grantor F Name": congrname.text,
        "Status": "Requested",
        'ID':sanctionloanrequestid,
        "Grantor F FatherName": congrfname.text,
        "Grantor F Relation": congrrelation.text,
        "Grantor F Mobile": congrmobile.text,
      }).then((value) async {
        Get.offNamed(loanrequestlistPageRoute);
        Get.snackbar("Loan Sanction Added Successfully.",
            "Redirecting to Loan Sanction List Page.",
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

    void _setupinstallment(int ins) {
      setState(() {
        _selectedinstalment = InstallmentFrequencyList[ins];
      });
    }

    void _setuplloanperiod(int ins) {
      setState(() {
        _selectedloanperiod = LoanPeriodList[ins];
      });
    }

    void _setupgrantor1(int ins) {
      setState(() {
        selectedgrantor1 = allmemberss[ins];
      });
    }

    void _setupgrantor2(int ins) {
      setState(() {
        selectedgrantor2 = allmemberss[ins];
      });
    }
    void _setuploanpurpose(int ins) {
      setState(() {
        selectedloanpurpose = LoanPurposeList[ins];
      });
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),

            SizedBox(
              height: 50,
            ),

            LoanSamitteSelection(
                ssomitee: ssomitee,
                setupsomiti: _setupsomiti,
                conremarks: conremarks,
                consanctionlimit: consanctionlimit,
                coninstallmentamount: coninstallmentamount,
                coninstallmentno: coninstallmentno,
                selectedsomiteeid: selectedsomiti,setuploanpurpose: _setuploanpurpose,
                serviceamount: serviceamount,
                conservicecharge: conservicecharge,selectedloanpurpose: selectedloanpurpose,
                setupinstallment: _setupinstallment,
                setuplloanperiod: _setuplloanperiod,
                selectedDate: selectedDate,
                allmemberss: allmemberss,
                selectedinstalment: _selectedinstalment,
                setupmemberss: _setupmemberss,
                selectedloanperiod: _selectedloanperiod,
                onsubmit: _save,
                memberssselected: memberselection,
                selectedmemberssid: sselectedmemberss,
                somitee: somitee,
                selectedmemberss: selectedmemberss,
                onclear: _onclear,
                memberss: memberss,
                selectedsomitee: sselectedsomiti),

            SizedBox(
              height: 50,
            ),

            // Loan Guarantor information
            LoanGuarantor(
                allmemberss: allmemberss,
                setupgrantor1: _setupgrantor1,
                setupgrantor2: _setupgrantor2,
                selectedgrantor1: selectedgrantor1,
                selectedgrantor2: selectedgrantor2),

            SizedBox(
              height: 50,
            ),
            // LoanGuarantorFamily(),

            LoanGuarantor_family(
                congrname: congrname,
                congrfname: congrfname,
                congrmobile: congrmobile,
                congrrelation: congrrelation),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
