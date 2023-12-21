import 'package:flutter/material.dart';

class DesktopBranchCode extends StatefulWidget {
  const DesktopBranchCode({Key? key}) : super(key: key);

  @override
  State<DesktopBranchCode> createState() => _DesktopBranchCodeState();
}

class _DesktopBranchCodeState extends State<DesktopBranchCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("BranchCode"),
    );
  }
}
