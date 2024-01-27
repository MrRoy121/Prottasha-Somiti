import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/ReportsWidgets/SamiteeMemberDeposite.dart';

class SamiteeWiseMemberDepositeLoan extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeWiseMemberDepositeLoan({required this.appbool, required this.navbool});

  @override
  State<SamiteeWiseMemberDepositeLoan> createState() => _SamiteeWiseMemberDepositeLoanState();
}

class _SamiteeWiseMemberDepositeLoanState extends State<SamiteeWiseMemberDepositeLoan> {


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


            // SAMITEE WISE MEMBER DEPOSITE & LOAN
            SamiteeMemberDeposite(),



          ],
        ),
      ),

    );
  }
}
