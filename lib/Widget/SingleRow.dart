import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class SingleRow extends StatefulWidget {
  final String heading;
  final String field1;
  final String field2;
  const SingleRow({required this.field1, required this.field2, required this.heading});

  @override
  State<SingleRow> createState() => _SingleRowState();
}

class _SingleRowState extends State<SingleRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400,
      height: 180,
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
                    widget.heading,
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
                            text: widget.field1,
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
                              hintText: "Select",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.arrow_drop_down, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

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
                          RichText(
                            text: TextSpan(
                              text: widget.field2,
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
                                hintText: "Select",
                                hintStyle: TextStyle(
                                  color: AppColor_greyText,
                                ),
                                suffixIcon: Icon(Icons.arrow_drop_down, color: AppColor_greyText),
                              ),
                            ),

                          ),

                        ],
                      ),
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
