import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/NoDataFound.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';
import '../../../../Widget/SamiteeSelection.dart';
import '../../../../Widget/TransactionWidget/TransactionInformation.dart';


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

            SamiteeSelection(submit: true, selectmember: true, clear: true, close: true,),


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
