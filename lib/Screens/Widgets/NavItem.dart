import 'package:flutter/material.dart';



class NavbarItem extends StatelessWidget {
  bool flag;
  String text;
  var icon;

  NavbarItem({required this.text, required this.flag, required this.icon});

  @override
  Widget build(BuildContext context) {

    var ScreenWidth = MediaQuery.of(context).size.width;

    bool mobile = false;
    if(ScreenWidth <= 1000){
      mobile = true;
    } else {
      mobile = false;
    }


    return Row(
      children: [
        Container(
            width: 165,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                   color: flag == true ? Color(0xff648FFF) : Colors.transparent,
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    Expanded(child: SizedBox(width: 5)),
                    Icon(
                      icon,
                      size: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            )),

      ],
    );
  }
}
