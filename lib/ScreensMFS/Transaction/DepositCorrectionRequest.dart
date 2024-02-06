import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDeposit.dart';
import '../../Model/somitee.dart';
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
  State<DepositCorrectionRequest> createState() => _DepositCorrectionRequestState();
}

class _DepositCorrectionRequestState extends State<DepositCorrectionRequest> {

  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;

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
    });
  }

  @override
  Widget build(BuildContext context) {

    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
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

                  SizedBox(
                    height: 50,
                  ),



                  SamiteeSelection(
                      submit: false,
                      selectmember: false,
                      clear: true,
                      ssomitee: ssomitee,
                      close: true,
                      setupsomiti: _setupsomiti,
                      active: true,
                      selectedsomiteeid: selectedsomiti,
                      onsubmit: () {},
                      somitee: somitee,
                      onclear: _onclear,
                      selectedsomitee: sselectedsomiti),

                  SizedBox(
                    height: 50,
                  ),

                  // MEMBER DEPOSIT CORRECTION
                  MemberDeposit(),




                ],
              ),
            ),
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),
          ],
        ),
      ),

    );
  }
}
