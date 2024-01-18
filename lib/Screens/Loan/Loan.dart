import 'package:flutter/material.dart';

import '../../../../Widget/NavBool.dart';

class Loan extends StatefulWidget {
  Navbool navbool;
  Loan(this.navbool);

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Loan"
      ),
    );
  }
}
