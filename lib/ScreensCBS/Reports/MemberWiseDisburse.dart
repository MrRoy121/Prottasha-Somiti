import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import 'Widgets/MemberWiseDisburseWidget.dart';


class MemberWiseDisburse extends StatefulWidget {
  NavboolCBS navbool;
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
            NavbarScreenCBS(appbool: widget.appbool, navbool: widget.navbool,),

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
