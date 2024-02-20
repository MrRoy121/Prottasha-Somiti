import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Model/somitee.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/SamiteeMemberDeposite.dart';

class SamiteeWiseMemberDepositeLoan extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeWiseMemberDepositeLoan({required this.appbool, required this.navbool});

  @override
  State<SamiteeWiseMemberDepositeLoan> createState() =>
      _SamiteeWiseMemberDepositeLoanState();
}

class _SamiteeWiseMemberDepositeLoanState
    extends State<SamiteeWiseMemberDepositeLoan> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;
  bool samiteeselected = false;

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
  }

  _save() {}
  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      selectedsomiti = ss;samiteeselected =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];samiteeselected =true;
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
                  SamiteeMemberDeposite(
                    ssomitee: ssomitee,
                    setupsomiti: _setupsomiti,
                    selectedsomiteeid: selectedsomiti,
                    selectedsomitee: sselectedsomiti,
                    onsubmit: _save,
                    onclear: _onclear,
                    somitee: somitee,
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
