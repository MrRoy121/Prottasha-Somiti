// import 'package:flutter/material.dart';
// import 'package:prottashasomit/Constants/Constants.dart';
//
// import '../DesktopDashBoard/DashBoard.dart';
// import 'DesktopHomepage.dart';
//
// class DesktopHomeNavbar extends StatefulWidget {
//   const DesktopHomeNavbar({Key? key}) : super(key: key);
//
//   @override
//   State<DesktopHomeNavbar> createState() => _DesktopHomeNavbarState();
// }
//
// class _DesktopHomeNavbarState extends State<DesktopHomeNavbar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor,
//         title: DefaultTextStyle(
//           style: TextStyle(fontSize: 18, color: Colors.white),
//           child: Row(
//             children: [
//               SizedBox(width: 25,),
//               Image.asset('assets/logo.png', width: 60, height: 60),
//               SizedBox(width: 8),
//               Text('Prottasha Samitee Ltd.'),
//             ],
//           ),
//         ),
//         actions: [
//           buildAction('10-Oct-2023', Icons.calendar_month_sharp, () {
//             // Date function's code
//           }),
//           SizedBox(width: 25,),
//           buildAction('Home', Icons.home, () {
//             // Homepage Function's code
//           }),
//           SizedBox(width: 25,),
//           buildAction('Dashboard', Icons.bar_chart, () {
//             // Dashboard Function's code
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) =>  DesktopDashBoard()),
//             );
//           }),
//           SizedBox(width: 25,),
//           TextButton(
//             onPressed: () {
//               // Branch Code function's Code
//             },
//             child: Text('Branch Code - 98765', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
//           ),
//           SizedBox(width: 55,),
//           buildAction('admin_titas', Icons.person_2_rounded, () {
//             // Admin option's code
//           }),
//           SizedBox(width: 85,),
//         ],
//         iconTheme: IconThemeData(color: Colors.white),
//
//       ),
//
//       body: DesktopHomePage(),
//     );
//   }
//
//   Widget buildAction(String text, IconData? icon, VoidCallback onPressed) {
//     return InkWell(
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: [
//             Icon(icon),
//             SizedBox(width: 4),
//             Text(text, style: TextStyle(fontSize: 12, color: Colors.white)),
//           ],
//         ),
//       ),
//     );
//   }
// }
