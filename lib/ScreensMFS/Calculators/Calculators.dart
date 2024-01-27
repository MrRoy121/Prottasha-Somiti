import 'package:flutter/material.dart';

import '../Widget/NavBoolMFS.dart';


class Calculators extends StatefulWidget {
  Navbool navbool;
  Calculators(this.navbool);

  @override
  State<Calculators> createState() => _CalculatorsState();
}

class _CalculatorsState extends State<Calculators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Calculators"),
    );
  }
}
