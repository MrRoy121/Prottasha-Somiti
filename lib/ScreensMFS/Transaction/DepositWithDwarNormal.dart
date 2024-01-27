import 'dart:html';

import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/TransactionWidget/DepositWithDwar.dart';
import '../Widget/TransactionWidget/Image.dart';
import '../Widget/TransactionWidget/LinkACinfo.dart';
import '../Widget/TransactionWidget/MemberDepositWithdearRequest.dart';

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

    var ScreenWidth =MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if(ResponsiveWidth > 1400){
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540){
      tablet = true;
      desktop = false;
      mobile = false;
    }else{
      mobile = true;
      desktop = false;
      tablet = false;
    }

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
           // SamiteeSelection(submit: false, selectmember: false, clear: false, close: false,active: true,onsubmit: (){}),

            SizedBox(
              height: 50,
            ),

            // Deposit Withdraw
            DepositWithDwar(),


            SizedBox(
              height: 50,
            ),

            // Link A/c Information
            Padding(
              padding:  EdgeInsets.only(left: ScreenWidth/21.94),
              child: desktop? Row(
                children: [
                  LinkACinfo(),

                  Spacer(),

                  ImageMember(imgurl: ""),
                ],
              ) :
              Column(
                children: [
                  LinkACinfo(),

                  // Spacer(),
                  SizedBox(height: 50,),

                  ImageMember(imgurl: ""),
                ],
              )
              ,
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
