import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Constants.dart';

class LoanDetailsWidget extends StatefulWidget {
  String title;
  void Function() onsubmit;
  void Function() onclear;bool showfine;
  void Function() onfine;

  LoanDetailsWidget({required this.title,required this.onclear,required this.showfine,required this.onfine,required this.onsubmit,});

  @override
  State<LoanDetailsWidget> createState() => _LoanDetailsWidgetState();
}

class _LoanDetailsWidgetState extends State<LoanDetailsWidget> {


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


    return desktop? Column(
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
                  widget.title,
                  style: TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),


              Spacer(),


              widget.showfine?InkWell(
                onTap: (){
                widget.onfine();},
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm_outlined, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Penulty", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ):SizedBox(),
              widget.showfine?SizedBox(width: 10,):SizedBox(),

              InkWell(onTap: (){
                widget.onsubmit();},
                child: Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  color: Colors.green,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(onTap: (){
                widget.onclear();},
                child: Container(
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
              ),

              SizedBox(width: 10,),


              InkWell(onTap: (){
                Get.back();},
                child: Container(
                  height: 40,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20),
                    child: Text("X", style: TextStyle(color: Colors.white, fontSize: 14),),
                  ),
                  color: Colors.red,
                ),
              ),

              SizedBox(width: 10,),

            ],
          ),
        ),
      ],
    )
    : tablet? Column(
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
                  widget.title,
                  style: TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

              Spacer(),


              widget.showfine?InkWell(
                onTap: (){
                  widget.onfine();},
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm_outlined, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Penulty", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ):SizedBox(),
              widget.showfine?SizedBox(width: 10,):SizedBox(),
              InkWell(onTap: (){
                widget.onsubmit();},
                child: Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 8),),
                  ),
                  color: Colors.green,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(onTap: (){
                widget.onclear();},
                child: Container(
                  height: 40,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.clear_all_sharp, color: Colors.white, size: 12,),
                        SizedBox(width: 5,),
                        Text("Clear", style: TextStyle(color: Colors.white, fontSize: 8),),
                      ],
                    ),
                  ),
                  color: AppColor_yellow,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(onTap: (){
                Get.back();},
                child: Container(
                  height: 40,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 20),
                    child: Text("X", style: TextStyle(color: Colors.white, fontSize: 8),),
                  ),
                  color: Colors.red,
                ),
              ),

              SizedBox(width: 10,),

            ],
          ),
        ),
      ],
    )
    : Column(
      children: [
        Container(
          width: 1400,
          height: 30,
          color: navbarColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: ScreenWidth/38.4),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: AppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),

              Spacer(),


              widget.showfine?InkWell(
                onTap: (){
                  widget.onfine();},
                child: Container(
                  height: 40,
                  width: 100,
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm_outlined, color: Colors.white, size: 18,),
                        SizedBox(width: 5,),
                        Text("Penulty", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                ),
              ):SizedBox(),
              widget.showfine?SizedBox(width: 10,):SizedBox(),
              InkWell(onTap: (){
                widget.onsubmit();},
                child: Container(
                  height: 30,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 15),
                    child: Text("✓ Submit", style: TextStyle(color: Colors.white, fontSize: 8),),
                  ),
                  color: Colors.green,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(onTap: (){
                widget.onclear();},
                child: Container(
                  height: 30,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 15),
                    child: Row(
                      children: [
                        Icon(Icons.clear_all_sharp, color: Colors.white, size: 12,),
                        SizedBox(width: 5,),
                        Text("Clear", style: TextStyle(color: Colors.white, fontSize: 8),),
                      ],
                    ),
                  ),
                  color: AppColor_yellow,
                ),
              ),

              SizedBox(width: 10,),

              InkWell(onTap: (){
                Get.back();},
                child: Container(
                  height: 30,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Text("X", style: TextStyle(color: Colors.white, fontSize: 8),),
                  ),
                  color: Colors.red,
                ),
              ),

              SizedBox(width: 10,),

            ],
          ),
        ),
      ],
    );
  }
}
