import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/NoDataFound.dart';


class DeadMemberInfo extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DeadMemberInfo({required this.appbool, required this.navbool});

  @override
  State<DeadMemberInfo> createState() => _DeadMemberInfoState();
}

class _DeadMemberInfoState extends State<DeadMemberInfo> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [



           // SamiteeSelection(submit: true, selectmember: false, clear: true, close: true,active: true,onsubmit: (){}),



            Container(
              margin: EdgeInsets.only(top: 100, left: 50),
                child: NoDataFound(title: "Dead Member Report")
            ),

            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),


          ],
        ),
      ),

    );
  }
}
