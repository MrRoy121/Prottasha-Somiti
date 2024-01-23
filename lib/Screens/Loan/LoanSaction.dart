import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LoanGuarantor.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LoanGuarantor.dart';
import 'package:prottashasomit/Screens/Loan/widgets/LoanSamitteSelection.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/member.dart';
import 'package:get/get.dart';
import '../../../../Model/somitee.dart';
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
  var coninstallmentno = TextEditingController();
  var conremarks = TextEditingController();
  var coninstallmentamount = TextEditingController();
  var consanctionlimit = TextEditingController();
  var conservicecharge = TextEditingController();
  var congrfname = TextEditingController();
  var congrffname = TextEditingController();
  var congrfrelation = TextEditingController();
  var congrfmobile = TextEditingController();
  var congrfocupasion = TextEditingController();
  var congrsname = TextEditingController();
  var congrsfname = TextEditingController();
  var congrsrelation = TextEditingController();
  var congrsmobile = TextEditingController();
  var congrsocupasion = TextEditingController();
  var congrpname = TextEditingController();
  var congrpfname = TextEditingController();
  var congrprelation = TextEditingController();
  var congrpmobile = TextEditingController();
  var congrpocupasion = TextEditingController();
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

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      selectedsomiti = ss;
      selectedmemberss = ss;
      selectedloanpurpose = ss;
      _selectedinstalment = ss;
      _selectedloanperiod = ss;
      consanctionlimit.text = "";
      conservicecharge.text = "";
      coninstallmentno.text = "";
      coninstallmentamount.text = "";
      serviceamount = 0;
      conremarks.text = "";
      congrfname.text = "";
      congrffname.text = "";
      congrfrelation.text = "";
      congrfmobile.text = "";
      congrfocupasion.text = "";
      congrsname.text = "";
      congrsfname.text = "";
      congrsrelation.text = "";
      congrsmobile.text = "";
      congrsocupasion.text = "";
      congrpname.text = "";
      congrpfname.text = "";
      congrprelation.text = "";
      congrpmobile.text = "";
      congrpocupasion.text = "";
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
        selectedloanpurpose == null ||
        congrfname.text == "" ||
        congrffname.text == "" ||
        congrfrelation.text == "" ||
        congrfmobile.text == "" ||
        congrfocupasion.text == "" ||
        congrsname.text == "" ||
        congrsfname.text == "" ||
        congrsrelation.text == "" ||
        congrsmobile.text == "" ||
        congrsocupasion.text == "" ||
        congrpname.text == "" ||
        congrpfname.text == "" ||
        congrprelation.text == "" ||
        congrpmobile.text == "" ||
        congrpocupasion.text == "" ||
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
        "Loan Purpose": selectedloanpurpose,
        "Loan Period": _selectedloanperiod,
        "Service Charge": double.parse(conservicecharge.text),
        "Installment No": double.parse(coninstallmentno.text),
        "Installment Amount": double.parse(coninstallmentamount.text),
        "Remarks": conremarks.text,
        "Service Amount": serviceamount,
        "Status": "Requested",
        'ID': sanctionloanrequestid,
        "Grantor F Name": congrfname.text,
        "Grantor F FatherName": congrffname.text,
        "Grantor F Relation": congrfrelation.text,
        "Grantor F Mobile": congrfmobile.text,
        "Grantor F Occupation": congrfocupasion.text,
        "Grantor S Name": congrsname.text,
        "Grantor S FatherName": congrsfname.text,
        "Grantor S Relation": congrsrelation.text,
        "Grantor S Mobile": congrsmobile.text,
        "Grantor S Occupation": congrsocupasion.text,
        "Grantor P Name": congrpname.text,
        "Grantor P FatherName": congrpfname.text,
        "Grantor P Relation": congrprelation.text,
        "Grantor P Mobile": congrpmobile.text,
        "Grantor P Occupation": congrpocupasion.text,
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
                selectedsomiteeid: selectedsomiti,
                setuploanpurpose: _setuploanpurpose,
                serviceamount: serviceamount,
                conservicecharge: conservicecharge,
                selectedloanpurpose: selectedloanpurpose,
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
            LoanGuarantor(
                sss: "Social",
                congrname: congrsname,
                congrfname: congrsfname,
                congrmobile: congrsmobile,
                congropcupasion: congrsocupasion,
                congrrelation: congrsrelation),
            SizedBox(
              height: 50,
            ),
            LoanGuarantor(
                sss: "Family",
                congrname: congrfname,
                congrfname: congrffname,
                congrmobile: congrfmobile,
                congropcupasion: congrfocupasion,
                congrrelation: congrfrelation),
            SizedBox(
              height: 50,
            ),
            LoanGuarantor(
                sss: "Bussiness",
                congrname: congrpname,
                congrfname: congrpfname,
                congrmobile: congrpmobile,
                congropcupasion: congrpocupasion,
                congrrelation: congrprelation),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
