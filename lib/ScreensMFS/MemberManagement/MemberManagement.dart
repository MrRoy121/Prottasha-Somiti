import 'package:flutter/material.dart';

import '../Widget/NavBoolMFS.dart';

class MemberManagement extends StatefulWidget {
  Navbool navbool;
  MemberManagement(this.navbool);

  @override
  State<MemberManagement> createState() => _MemberManagementState();
}

class _MemberManagementState extends State<MemberManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("MemberManagment"),
    );
  }
}
