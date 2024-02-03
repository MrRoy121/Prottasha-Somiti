import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ScreensCBS/Widgets/NavBoolCBS.dart';
import '../../ScreensCBS/Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../ScreensMFS/Widget/NavBoolMFS.dart';
import '../../ScreensMFS/Widget/NavbarScreenMFS.dart';

class DashBoard extends StatefulWidget {
  Navbool navbool;
  NavboolCBS navboolcbs;
  Appbool appbool;
  DashBoard(
      {required this.appbool, required this.navbool, required this.navboolcbs});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool sss = false;
  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sss = prefs.getBool('CBS') ?? false;setState(() {

    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: sss
          ? NavbarScreenCBS(
              appbool: widget.appbool,
              navbool: widget.navboolcbs,
            )
          : NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
    );
  }
}
