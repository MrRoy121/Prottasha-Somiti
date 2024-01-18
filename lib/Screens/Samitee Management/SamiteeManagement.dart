import 'package:flutter/material.dart';

import '../../../../Widget/NavBool.dart';

class SamiteeManagement extends StatefulWidget {
  Navbool navbool;
  SamiteeManagement(this.navbool);

  @override
  State<SamiteeManagement> createState() => _SamiteeManagementState();
}

class _SamiteeManagementState extends State<SamiteeManagement> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Samitee Management"),
    );
  }
}
