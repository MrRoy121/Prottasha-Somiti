import 'package:flutter/material.dart';

import '../Constants/Constants.dart';


class AppbarItem extends StatelessWidget {
  bool flag;
  String text;
  var icon;

  AppbarItem({required this.text, required this.flag, required this.icon});

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
        !mobile ? SizedBox(
          width: ScreenWidth/48.4,
        ): Expanded(
          child: SizedBox(),
        ),
        Container(
            //width: mobile?  80:MediaQuery.of(context).size.width * 0.2 - 80,
          width: ScreenWidth/10.24,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  // color: flag == true ? Colors.blue[50] : null,
                  borderRadius: BorderRadius.circular(5),
                ),
                // margin: EdgeInsets.only(left: 10, top: 10),
                padding: EdgeInsets.all(ScreenWidth/145.2),
                child: mobile? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      size:25,
                      color: Colors.white,
                    ),
                  ],
                ) : Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      size: ScreenWidth/90.75,
                      color: Colors.white,
                    ),
                    SizedBox(width: ScreenWidth/181.5),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: flag ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )),
        !mobile ? SizedBox(
        ): Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }
}
