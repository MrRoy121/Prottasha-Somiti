import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';

class ReScheduleLoanInfo extends StatefulWidget {


  @override
  State<ReScheduleLoanInfo> createState() => _ReScheduleLoanInfoState();
}

class _ReScheduleLoanInfoState extends State<ReScheduleLoanInfo> {
  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if(ResponsiveWidth > 1400){
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540){
      tablet = true;
      desktop = false;
      mobile = false;
    }else{
      mobile = true;
      desktop = false;
      tablet = false;
    }


    return desktop? Container(
      width: 1400,
      //height: 350,
      height: 1900,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Account Type :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Open Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Service Charge (%) :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Account Open By :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),


                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Account Title :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Loan Period :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Installment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction ID :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Service Charge Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Current CL Status: ",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                )
              ],
            ),
          ),

          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Disburse Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Total Repayment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Loan Expiry Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Disburse Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Schedule Start Date :",
                          style: TextStyle(
                            color: Colors.black,
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


                  ],
                )
              ],
            ),
          ),


          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Principle Outstanding :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Expiry Interest Outstanding :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Repayment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Paid Expiry Interest Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Paid Interest :",
                          style: TextStyle(
                            color: Colors.black,
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


                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Interest Outstanding  :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Repayment Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Reschedule Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Paid Principle :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                )
              ],
            ),
          ),

          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "No of Rescheduling :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Last Rescheduling Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Last Rescheduling Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                  ],
                )
              ],
            ),
          ),

        ],
      ),
    )
    : tablet? Container(
      width: 1400,
      //height: 350,
      height: 1900,
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
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Account Type :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Open Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Service Charge (%) :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Account Open By :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),


                  ],
                ),

                SizedBox(
                  height: 50,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Account Title :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Loan Period :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Installment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction ID :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction Amount :",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 30,),


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
                          "Service Charge Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Current CL Status: ",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                )
              ],
            ),
          ),

          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Disburse Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Total Repayment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Loan Expiry Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Disburse Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Schedule Start Date :",
                          style: TextStyle(
                            color: Colors.black,
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


                  ],
                )
              ],
            ),
          ),


          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Principle Outstanding :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Expiry Interest Outstanding :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Repayment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Paid Expiry Interest Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Paid Interest :",
                          style: TextStyle(
                            color: Colors.black,
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


                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Interest Outstanding  :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Repayment Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Reschedule Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Paid Principle :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                )
              ],
            ),
          ),

          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "No of Rescheduling :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Last Rescheduling Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Last Rescheduling Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                  ],
                )
              ],
            ),
          ),

        ],
      ),
    )
    : Container(
      width: 1400,
      //height: 350,
      height: 2400,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Account Type :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Open Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "No of Installment :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Service Charge (%) :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Account Open By :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),


                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Account Title :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Loan Period :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Installment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction ID :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Sanction Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Service Charge Amount :",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 10,),


                        SizedBox(
                          width: 280,
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
                          "Current CL Status: ",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                )
              ],
            ),
          ),

          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Disburse Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Total Repayment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Loan Expiry Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  height: 50,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Disburse Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Schedule Start Date :",
                          style: TextStyle(
                            color: Colors.black,
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


                  ],
                )
              ],
            ),
          ),


          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Principle Outstanding :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Expiry Interest Outstanding :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Repayment Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Paid Expiry Interest Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Paid Interest :",
                          style: TextStyle(
                            color: Colors.black,
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


                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Interest Outstanding  :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Repayment Date :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Reschedule Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        Text(
                          "Last Paid Principle :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                )
              ],
            ),
          ),

          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),

                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 150),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "No of Rescheduling :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Last Rescheduling Amount :",
                          style: TextStyle(
                            color: Colors.black,
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

                    SizedBox(height: 30,),

                  ],
                ),

                SizedBox(
                  width: 200,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        Text(
                          "Last Rescheduling Date :",
                          style: TextStyle(
                            color: Colors.black,
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
