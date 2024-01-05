import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/Screens/DesktopScreen/DesktopScaffold.dart';
import 'package:prottashasomit/Screens/MobileScreen/MobileScaffold.dart';
import 'package:prottashasomit/Screens/TabletScreen/TabletScaffold.dart';

import 'Constants/responsive.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCU3KjFwWGNfbqDPyHFbzb4RzHKhQ-CNio",
        authDomain: "prottshasomitee.firebaseapp.com",
        projectId: "prottshasomitee",
        storageBucket: "prottshasomitee.appspot.com",
        messagingSenderId: "85054437453",
        appId: "1:85054437453:web:0d286f140c6f63504e0404",
        measurementId: "G-XQPZLS697J"),
  );


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
