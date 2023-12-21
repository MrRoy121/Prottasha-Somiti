import 'package:flutter/material.dart';

import '../../../Widget/Appbool.dart';

class Admin_titas extends StatefulWidget {
  const Admin_titas(Appbool navbool, {Key? key}) : super(key: key);

  @override
  State<Admin_titas> createState() => _Admin_titasState();
}

class _Admin_titasState extends State<Admin_titas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Admin'),
    );
  }
}
