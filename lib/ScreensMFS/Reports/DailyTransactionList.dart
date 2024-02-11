import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/TransactionList.dart';


class DailyTransactionList extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DailyTransactionList({required this.appbool, required this.navbool});

  @override
  State<DailyTransactionList> createState() => _DailyTransactionListState();
}

class _DailyTransactionListState extends State<DailyTransactionList> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),

            SizedBox(
              height: 50,
            ),


            // DAILY TRANSACTION LIST
            TransactionList(),


          ],
        ),
      ),

    );
  }
}
