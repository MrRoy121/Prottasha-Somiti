import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/DepositWithDwar.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/Image.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/LinkACinfo.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDepositWithdearRequest.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';


class DepositWithDwarNormal extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositWithDwarNormal({required this.appbool, required this.navbool});

  @override
  State<DepositWithDwarNormal> createState() => _DepositWithDwarNormalState();
}

class _DepositWithDwarNormalState extends State<DepositWithDwarNormal> {
  var ss;

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if (ResponsiveWidth > 1400) {
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540) {
      tablet = true;
      desktop = false;
      mobile = false;
    } else {
      mobile = true;
      desktop = false;
      tablet = false;
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child:Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  // Member Deposit Withdraw Request
                  MemberDepositWithdwar(
                    submit: true,
                    selectmember: false,
                  ),

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
                    padding: EdgeInsets.only(left: ScreenWidth / 21.94),
                    child: desktop
                        ? Row(
                            children: [
                              LinkACinfo(memberss: ss,selectedsanction: ss,bsanction: false,scheme: ss),
                              Spacer(),
                              ImageMember(imgurl: ""),
                            ],
                          )
                        : Column(
                            children: [
                              LinkACinfo(memberss: ss,selectedsanction: ss,bsanction: false,scheme: ss),

                              // Spacer(),
                              SizedBox(
                                height: 50,
                              ),

                              ImageMember(imgurl: ""),
                            ],
                          ),
                  ),

                  SizedBox(
                    height: 50,
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
