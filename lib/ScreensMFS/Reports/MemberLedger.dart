import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/ReportsWidgets/Ledger.dart';


class MemberLedger extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberLedger({required this.appbool, required this.navbool});

  @override
  State<MemberLedger> createState() => _MemberLedgerState();
}

class _MemberLedgerState extends State<MemberLedger> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),


            // MEMBERS LEDGER
            Ledger(),


          ],
        ),
      ),

    );
  }
}
