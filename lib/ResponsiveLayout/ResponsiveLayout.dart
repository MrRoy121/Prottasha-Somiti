import 'package:flutter/material.dart';

class ResponsiveScreenLayout extends StatelessWidget {

  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  ResponsiveScreenLayout({required this.mobileScaffold, required this.tabletScaffold, required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrants){
          if(constrants.maxWidth < 500){
            return mobileScaffold;
          } else if (constrants.maxWidth < 1100){
            return tabletScaffold;
          } else {
            return desktopScaffold;
          }
        }
    );
  }
}
