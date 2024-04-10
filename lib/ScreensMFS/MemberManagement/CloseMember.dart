import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../Model/member.dart';
import '../../../Model/somitee.dart';
import '../../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/MemberRequestOfClosing.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/SamiteeSelection.dart';

class CloseMember extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  CloseMember({required this.appbool, required this.navbool});

  @override
  State<CloseMember> createState() => _CloseMemberState();
}

class _CloseMemberState extends State<CloseMember> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<Memberss> allmemberss = [];
  List<Memberss> memberss = [];
  bool mem = false;
  bool memberselection = false;
  var selectedsomiti;
  var sselectedsomiti;
  var selectedmemberss;
  var sselectedmemberss;
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
            closed: element["Closed"],
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
        if (element["Status"]) {
          allmemberss.add(Memberss(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              occupation: element["Occupation"],
              firstname: element["First Name"],dead: element['Dead'],
              lastname: element["Last Name"],
              sts: element["Status"],
              fathername: element["Father Name"],
              mothername: element["Mother Name"],
              gender: element["Gender"],
              religion: element["Religion"],
              nationalid: element["National ID"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
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
      selectedsomiti = ss;
      sselectedsomiti = ss;
      selectedmemberss = ss;
      sselectedmemberss = ss;
      memberselection = false;
      mem = false;
    });
  }

  _save() {
    FirebaseFirestore.instance
        .collection('ClosedMemberRequest')
        .doc(selectedmemberss.id)
        .get()
        .then((value) {
      if (value.exists) {
        Get.snackbar("A Closing Request Is Already Added for this member.",
            "Wait for the authority to Approve It!.",
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
            .collection('ClosedMemberRequest')
            .doc(selectedmemberss.id)
            .set({
          'Name': selectedmemberss.firstname + " " + selectedmemberss.lastname,
          'Loan Pending Amount': selectedmemberss.loanpendingamount,
          'Own Deposit': selectedmemberss.owndepositamount,
          'Type':"Close",
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
        }).then((value) {
          Get.offNamed(closingmemberrequestPageRoute);
          Get.snackbar("Member Closing Request Added Successfully.",
              "Redirecting to Member Closing List Page.",
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
        mem = true;
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
              child: SamiteeSelection(
                  submit: true,
                  selectmember: false,
                  clear: true,
                  ssomitee: ssomitee,
                  close: true,
                  setupsomiti: _setupsomiti,
                  active: false,
                  selectedsomiteeid: selectedsomiti,
                  onsubmit: _save,
                  somitee: somitee,
                  onclear: _onclear,
                  selectedsomitee: sselectedsomiti),
            ),


            // MEMBER REQUEST FOR CLOSING
            Container(
              margin: EdgeInsets.only(top: 500, left: 50, bottom: 50),
              child: MemberRequestClosing(
                setupmemberss: _setupmemberss,
                mem: mem,
                memberssselected: memberselection,
                selectedmemberssid: sselectedmemberss,
                selectedmemberss: selectedmemberss,
                memberss: memberss,
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
