import 'package:flutter/material.dart';

import '../../Widget/Appbool.dart';
import '../../Widget/NavBool.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({Key? key}) : super(key: key);

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {

  Appbool appbool = Appbool(true, false, false);
  Navbool navbool = Navbool(true, false, false, false, false, false, false, false, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
