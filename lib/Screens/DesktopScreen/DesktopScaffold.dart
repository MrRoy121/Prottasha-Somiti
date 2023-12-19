import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopHomepage/DesktopHomeNavbar.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesktopHomeNavbar(),
    );
  }
}
