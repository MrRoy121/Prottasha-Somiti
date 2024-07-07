import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import 'Widgets/LedgerStatement.dart';



class GenerallLedgerStatement extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  GenerallLedgerStatement({required this.appbool, required this.navbool});

  @override
  State<GenerallLedgerStatement> createState() => _GenerallLedgerStatementState();
}

class _GenerallLedgerStatementState extends State<GenerallLedgerStatement> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreenCBS(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),


            // GENERAL LEDGER STATEMENT
            LedgerStatement(),




          ],
        ),
      ),

    );
  }
}
