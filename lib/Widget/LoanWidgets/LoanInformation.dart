import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';

class LoanInformation extends StatefulWidget {


  @override
  State<LoanInformation> createState() => _LoanInformationState();
}

class _LoanInformationState extends State<LoanInformation> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1400,
      //height: 350,
      height: 450,
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
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Sanction ID',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Sanction ID",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Member Loan ID :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 20,),


                        SizedBox(
                          width: 300,
                          child: TextField(
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
                          "Disburse Amount :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 25,),

                        SizedBox(
                          width: 300,
                          child: TextField(
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
                          "PIN Code :",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(width: 60,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter PIN Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),

                            ),
                          ),

                        ),

                      ],
                    ),
                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                        children: [
                          Text(
                            "Member Name :",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                          SizedBox(width: 120,),

                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Death Risk Amount :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 40,),

                        SizedBox(
                          width: 300,
                          child: TextField(
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
                        RichText(
                          text: TextSpan(
                            text: 'Narration',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Somitee/ Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
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
