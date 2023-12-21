import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbool.dart';

import '../../../Constants/Constants.dart';

class DesktopDashBoard extends StatefulWidget {
  const DesktopDashBoard(Appbool navbool, {Key? key}) : super(key: key);

  @override
  State<DesktopDashBoard> createState() => _DesktopDashBoardState();
}

class _DesktopDashBoardState extends State<DesktopDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Text("DashBoard"),

    );
  }

}
