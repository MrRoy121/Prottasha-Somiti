import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/TransactionWidget/DepositWithDwar.dart';
import '../../../../Widget/TransactionWidget/Image.dart';
import '../../../../Widget/TransactionWidget/LinkACinfo.dart';
import '../../../../Widget/TransactionWidget/MemberDepositWithdearRequest.dart';


class DepositWithDwarNormal extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositWithDwarNormal({required this.appbool, required this.navbool});

  @override
  State<DepositWithDwarNormal> createState() => _DepositWithDwarNormalState();
}

class _DepositWithDwarNormalState extends State<DepositWithDwarNormal> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),

            MemberDepositWithdwar(submit: true, selectmember: false,),


            SizedBox(
              height: 50,
            ),

            SamiteeSelection(submit: true, selectmember: false,),

            SizedBox(
              height: 50,
            ),
            DepositWithDwar(),


            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  LinkACinfo(),

                  Spacer(),

                  ImageMember(),
                ],
              ),
            ),

            SizedBox(
              height: 50,
            ),


          ],
        ),
      ),

    );
  }
}
