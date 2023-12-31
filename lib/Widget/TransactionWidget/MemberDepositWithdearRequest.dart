import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';


class MemberDepositWithdwar extends StatefulWidget {

  bool submit = true;
  bool selectmember = false;
  MemberDepositWithdwar({required this.submit, required this.selectmember});

  @override
  State<MemberDepositWithdwar> createState() => _MemberDepositWithdwarState();
}

class _MemberDepositWithdwarState extends State<MemberDepositWithdwar> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1400,
      //height: 350,
      height: 200,
      // color: Colors.white,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
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
                    "Member Deposit Withdraw Request",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                Spacer(),

                widget.submit? Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  color: Colors.green,
                ): Container(),

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

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Text(
                  "Withdraw Type",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 180),
                Row(
                  children: [
                    Radio(
                      value: 'normalwindow',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value.toString();
                        });
                      },
                    ),
                    Text('Normal Window'),
                    SizedBox(width: 10),
                    Radio(
                      value: 'closewindow',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value.toString();
                        });
                      },
                    ),
                    Text('Close Window'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
