import 'package:flutter/material.dart';

import '../Widget/NavBoolMFS.dart';


class Employee extends StatefulWidget {
  Navbool navbool;
  Employee(this.navbool);

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Employee"),
    );
  }
}
