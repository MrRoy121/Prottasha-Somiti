import 'package:flutter/material.dart';

import '../Widget/NavBoolMFS.dart';

class Accounts extends StatefulWidget {
  Navbool navbool;
  Accounts(this.navbool);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Accounts"),
    );
  }
}
