import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  var conid = TextEditingController();
  var conpass = TextEditingController();
  bool sts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/login_bg.png"), fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 440,
              height: 600,
              margin: EdgeInsets.only(bottom: 60),
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      "Assets/logo.png",
                      height: 170,
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "Prottsha Samitee Ltd.",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    "Login In Account",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 22,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 50,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 295,
                        height: 50,
                        child: TextField(
                          controller: conid,
                          decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            labelText: "User ID",
                            fillColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 50,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 295,
                        height: 50,
                        child: TextField(
                          obscureText: true,
                          controller: conpass,
                          decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            labelText: "Password",
                            fillColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: sts,
                        onChanged: (val) {
                          setState(() {
                            sts = val!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        "Keep me logged in",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w100),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 3,
                        ),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 14,
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'opensans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
