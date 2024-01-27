import 'package:flutter/material.dart';

import '../Widget/NavBoolMFS.dart';


class SpecialConsideration extends StatefulWidget {
  Navbool navbool;
  SpecialConsideration(this.navbool);

  @override
  State<SpecialConsideration> createState() => _SpecialConsiderationState();
}

class _SpecialConsiderationState extends State<SpecialConsideration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Special Consideration'
      ),
    );
  }
}
