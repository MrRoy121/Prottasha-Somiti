import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';

class LoanDetailsWidget extends StatefulWidget {


  @override
  State<LoanDetailsWidget> createState() => _LoanDetailsWidgetState();
}

class _LoanDetailsWidgetState extends State<LoanDetailsWidget> {


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: 1400,
          height: 40,
          color: navbarColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Text(
                  "Loan Disbursement Details",
                  style: TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              Spacer(),

              Container(
                height: 40,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 15),
                  child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 14),),
                ),
                color: Colors.green,
              ),

              SizedBox(width: 10,),

              Container(
                height: 40,
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, left: 15),
                  child: Row(
                    children: [
                      Icon(Icons.clear_all_sharp, color: Colors.white, size: 18,),
                      SizedBox(width: 5,),
                      Text("Clear", style: TextStyle(color: Colors.white, fontSize: 14),),
                    ],
                  ),
                ),
                color: AppColor_yellow,
              ),

              SizedBox(width: 10,),

              Container(
                height: 40,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20),
                  child: Text("X", style: TextStyle(color: Colors.white, fontSize: 14),),
                ),
                color: Colors.red,
              ),

              SizedBox(width: 10,),

            ],
          ),
        ),
      ],
    );
  }
}
