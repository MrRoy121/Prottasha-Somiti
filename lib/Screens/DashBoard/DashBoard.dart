import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    bool sss = arguments['CBS'];

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
