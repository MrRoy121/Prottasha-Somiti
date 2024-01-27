import 'package:flutter/material.dart';

import '../Widget/NavBool.dart';

class Reports extends StatefulWidget {
  Navbool navbool;
  Reports(this.navbool);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Reports"),
    );
  }
}
