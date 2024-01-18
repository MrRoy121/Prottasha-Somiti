import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../Widget/NavbarScreen.dart';

class DesktopDashBoard extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DesktopDashBoard({required this.appbool, required this.navbool});

  @override
  State<DesktopDashBoard> createState() => _DesktopDashBoardState();
}

class _DesktopDashBoardState extends State<DesktopDashBoard> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: Appbar(
          navbool: widget.appbool,
        ),
        body: NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),

    );
  }
}
