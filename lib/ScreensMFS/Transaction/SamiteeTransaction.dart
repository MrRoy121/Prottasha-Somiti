import 'package:flutter/material.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBool.dart';
import '../Widget/NavbarScreen.dart';
import '../Widget/TransactionWidget/TransactionInformation.dart';


class SamiteeTransaction extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeTransaction({required this.appbool, required this.navbool});

  @override
  State<SamiteeTransaction> createState() => _SamiteeTransactionState();
}

class _SamiteeTransactionState extends State<SamiteeTransaction> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),

         //   SamiteeSelection(submit: true, selectmember: true, clear: true, close: true,active: true,onsubmit: (){}),


            SizedBox(
              height: 50,
            ),

            // TRANSACTION INFORMATION
            TransactionInformation(),


          ],
        ),
      ),

    );
  }
}
