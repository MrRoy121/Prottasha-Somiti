import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/DepositWithDwar.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDepositWithdearRequest.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';


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
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [

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
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),
          ],
        ),
      ),

    );
  }
}
