import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';


class LoanGuarantor extends StatefulWidget {

  var  congrname;
  var  congrfname;
  var  congrrelation;
  var  congrmobile;
  var  congropcupasion;

  String sss;
  LoanGuarantor(
      {required this.sss,required this.congrname,required this.congrfname,required this.congropcupasion,required this.congrmobile,required this.congrrelation});
  @override
  State<LoanGuarantor> createState() => _LoanGuarantorState();
}

class _LoanGuarantorState extends State<LoanGuarantor> {
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
            height: 350,
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
                          "Loan Guarantor (${widget.sss})",
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
                  padding: const EdgeInsets.only(top: 20, left: 150),
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
                                child: TextField(controller: widget.congrname,
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
                                child: TextField(controller: widget.congrrelation,
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
                                "Ocupasion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(width: 115,),

                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.congropcupasion,
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
                                child: TextField(controller: widget.congrfname,
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
                              const Text(
                                "Guarantor Mobile No :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 30,),

                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.congrmobile,
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
    )
    : tablet? Container(
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
                          "Loan Guarantor (${widget.sss})",
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
                                child: TextField(controller: widget.congrname,
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
                                child: TextField(controller: widget.congrrelation,
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
                                "Ocupasion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(width:105,),

                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.congropcupasion,
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
                        height: 50,
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
                                child: TextField(controller: widget.congrfname,
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
                                child: TextField(controller: widget.congrmobile,
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
    )
    : Container(
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
                  height: 30,
                  color: navbarColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Loan Guarantor (${widget.sss})",
                          style: TextStyle(
                            color: AppColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
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
                        children: [
                          Row(
                            children: [
                              Text(
                                "Guarantor Name :",
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black,
                                ),
                              ),


                              SizedBox(width: 55,),


                              SizedBox(
                                width: 200,
                                child: TextField(controller: widget.congrname,
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
                                  fontSize: 8,
                                ),
                              ),

                              SizedBox(width: 25,),

                              SizedBox(
                                width: 200,
                                child: TextField(controller: widget.congrrelation,
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
                                "Ocupasion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(width: 15,),

                              SizedBox(
                                width: 200,
                                child: TextField(controller: widget.congropcupasion,
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
                        height: 50,
                      ),

                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Father Name :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),

                              SizedBox(width: 70,),

                              SizedBox(
                                width: 200,
                                child: TextField(controller: widget.congrfname,
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
                                  fontSize: 8,
                                ),
                              ),
                              SizedBox(width: 40,),

                              SizedBox(
                                width: 200,
                                child: TextField(controller: widget.congrmobile,
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
