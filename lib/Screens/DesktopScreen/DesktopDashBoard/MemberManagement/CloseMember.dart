import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/MemberRequestOfClosing.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';


class CloseMember extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  CloseMember({required this.appbool, required this.navbool});

  @override
  State<CloseMember> createState() => _CloseMemberState();
}

class _CloseMemberState extends State<CloseMember> {


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

           // SamiteeSelection(submit: true, selectmember: false, clear: true, close: true, active: false,onsubmit: (){}),


            SizedBox(
              height: 50,
            ),

            // MEMBER REQUEST FOR CLOSING
            MemberRequestClosing(),

            SizedBox(
              height: 50,
            ),

          ],
        ),
      ),

    );
  }
}
