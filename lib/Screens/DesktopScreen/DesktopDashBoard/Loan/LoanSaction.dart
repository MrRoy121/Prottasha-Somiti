import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../Widget/LoanWidgets/LoanGuarantor.dart';
import '../../../../Widget/LoanWidgets/LoanGuarantor_family.dart';
import '../../../../Widget/LoanWidgets/LoanSamitteSelection.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/TransactionWidget/MemberDeposit.dart';

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
  var sselectedsomiti;
  var selectedmemberss;
  var sselectedmemberss;
  var _selectedinstalment;
  var _selectedloanperiod;
  var selectedgrantor1;
  var selectedgrantor2;
  var _consanctionlimit = TextEditingController();

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
            nationalid: element["National ID"],
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

  void _onclear() {}

  void _save() async {}
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

            // Saction limit request
            LoanSamitteSelection(
                ssomitee: ssomitee,
                setupsomiti: _setupsomiti,
                consanctionlimit: _consanctionlimit,
                selectedsomiteeid: selectedsomiti,
                allmemberss: allmemberss,selectedinstalment: _selectedinstalment,
                setupmemberss: _setupmemberss,selectedloanperiod: _selectedloanperiod,
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
                selectedgrantor1: selectedgrantor1,
                selectedgrantor2: selectedgrantor2),

            SizedBox(
              height: 50,
            ),
            // LoanGuarantorFamily(),

            LoanGuarantor_family(),

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
