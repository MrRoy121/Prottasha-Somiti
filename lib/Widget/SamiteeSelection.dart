import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class SamiteeSelection extends StatefulWidget {

  bool submit = true;
  bool selectmember = false;
  SamiteeSelection({required this.submit, required this.selectmember});

  @override
  State<SamiteeSelection> createState() => _SamiteeSelectionState();
}

class _SamiteeSelectionState extends State<SamiteeSelection> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1400,
      //height: 350,
      height: widget.selectmember ? 450 : 350,
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
                    "Samitee Selection",
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
                Column(
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
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

                        SizedBox(width: 10,),


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
                          "Samitee Name :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 10,),


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
                           "Formation Date :",
                         style: TextStyle(
                           fontSize: 14,
                         ),
                       ),

                        SizedBox(width: 15,),

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

                    widget.selectmember ? Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Samitee',
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

                        SizedBox(width: 10,),


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
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ): SizedBox(),
                  ],
                ),

                SizedBox(
                  width: 250,
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Samitee Address :",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),

                          SizedBox(width: 80,),

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
                          "Active Member :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 12,),

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
