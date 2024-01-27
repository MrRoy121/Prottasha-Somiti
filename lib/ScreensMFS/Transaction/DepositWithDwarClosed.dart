import 'dart:html';

import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/TransactionWidget/DepositWithDwar.dart';
import '../Widget/TransactionWidget/MemberDepositWithdearRequest.dart';


class DepositWithDwarClosed extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositWithDwarClosed({required this.appbool, required this.navbool});

  @override
  State<DepositWithDwarClosed> createState() => _DepositWithDwarClosedState();
}

class _DepositWithDwarClosedState extends State<DepositWithDwarClosed> {


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


            // Member Deposit Withdraw Request
            MemberDepositWithdwar(submit: true, selectmember: false,),


            SizedBox(
              height: 50,
            ),

            // Somitee Selection
          //  SamiteeSelection(submit: false, selectmember: false, clear: false, close: false,active: true,onsubmit: (){}),

            SizedBox(
              height: 50,
            ),

            // Deposit Withdraw
            DepositWithDwar(),


            SizedBox(
              height: 50,
            ),


          ],
        ),
      ),

    );
  }
}
