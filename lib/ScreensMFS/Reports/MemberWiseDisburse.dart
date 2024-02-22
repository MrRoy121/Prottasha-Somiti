import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/MemberWiseDisburseWidget.dart';


class MemberWiseDisburse extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberWiseDisburse({required this.appbool, required this.navbool});

  @override
  State<MemberWiseDisburse> createState() => _MemberWiseDisburseState();
}

class _MemberWiseDisburseState extends State<MemberWiseDisburse> {


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

            MemberWiseDisburseWidget(),


          ],
        ),
      ),

    );
  }
}
