import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';

class RepaymentLoanINfo extends StatefulWidget {


  @override
  State<RepaymentLoanINfo> createState() => _RepaymentLoanINfoState();
}

class _RepaymentLoanINfoState extends State<RepaymentLoanINfo> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1400,
      //height: 350,
      height: 600,
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
                    "Loan Information",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Member Name :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),


                        SizedBox(width: 20,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Service Charge (%) :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),

                            ),
                          ),

                        ),


                      ],
                    ),


                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Sanction ID :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 45,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Installment Amount :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 25,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Text(
                          "Open Date :",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),

                            ),
                          ),

                        ),

                      ],
                    ),
                  ],
                ),

                SizedBox(
                  width: 100,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Loan Amount :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 120,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Loan Period :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 40,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(height: 40,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),

                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Disbursed Status :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 25,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Created By :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 25,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
