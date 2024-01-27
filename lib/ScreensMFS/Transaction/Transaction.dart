import 'package:flutter/material.dart';

import '../Widget/NavBool.dart';


class Transaction extends StatefulWidget {
  Navbool navbool;
  Transaction(this.navbool);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Transaction"),
    );
  }
}
