import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';


class LoanGuarantor_family extends StatefulWidget {

  @override
  State<LoanGuarantor_family> createState() => _LoanGuarantor_familyState();
}

class _LoanGuarantor_familyState extends State<LoanGuarantor_family> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      // width: 1400,
      // //height: 350,
      // height: 350,
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
            height: 300,
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
                          "Loan Guarantor (Family)",
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
                              Text(
                                "Guarantor Name :",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),


                              SizedBox(width: 65,),


                              SizedBox(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
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
                                "Relation with Beneficiary :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(width: 15,),

                              SizedBox(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 150,
                      ),

                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Father Name :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(width: 80,),

                              SizedBox(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
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
                                "Guarantor Mobile No :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 30,),

                              SizedBox(
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
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
        ],
      ),
    );
  }
}
