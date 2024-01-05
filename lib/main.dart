import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopScaffold.dart';
import 'package:prottashasomit/Screens/MobileScreen/MobileScaffold.dart';
import 'package:prottashasomit/Screens/TabletScreen/TabletScaffold.dart';

import 'Constants/responsive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Responsivess responsive = Responsivess(desktop: true, tablet: false, mobile: false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: DesktopScaffold()
      // home: LayoutBuilder(builder: (context, constrants) {
      //   if (constrants.maxWidth < 500) {
      //     responsive.makeMobile();
      //     return DesktopScaffold(
      //       rs: responsive,
      //     );
      //   } else if (constrants.maxWidth < 1100) {
      //     responsive.makeTablet();
      //     return DesktopScaffold(
      //       rs: responsive,
      //     );
      //   } else {
      //     responsive.makeDesktop();
      //     return DesktopScaffold(
      //       rs: responsive,
      //     );
      //   }
      // }
      // ),
    );
  }
}
