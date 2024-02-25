import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prottashasomit/Screens/roles/widgets/users_list_item.dart';
import '../../model/User.dart';

class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> allUsers = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    Future<List<User>> getCust() async {
      allUsers = [];
      await FirebaseFirestore.instance
          .collection('User')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) async {
          allUsers.add(User(
            id: element["ID"],
            sts: element["Status"],
            type: element['Type'],
            name: element["Name"],
            details: element["Details"],
            user: element['User'],
            lastlogin: element["Last Login"].toDate(),
            lastlogout: element["Last Logout"].toDate(),
            pass: element["Password"],
            phone: element["Phone"],
          ));
        });
      });
      return allUsers;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 50, top: 50),
              child: Text(
                "User List",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.shade200,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 30),
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                "SL",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'inter'),
                              ),
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 7),
                                    child: Text(
                                      "Name",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'inter'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Text(
                                "User ID",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'inter'),
                              ),
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 7),
                                    child: Text(
                                      "Last Login",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'inter'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 7),
                                    child: const Text(
                                      "Last Logout",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'inter'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Text(
                                "User Type",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'inter'),
                              ),
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Text(
                                "Role",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'inter'),
                              ),
                            ),
                          ),
                          Text("|"),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Text(
                                "ACTION",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'inter'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _height / 1.60,
                      child: FutureBuilder(
                        builder: (ctx, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text("No Roles Data Available.."),
                              );
                            } else if (snapshot.hasData) {
                              return MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  // physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return UsersListItem(
                                      index: index,
                                      cst: snapshot.data[index],
                                    );
                                  },
                                ),
                              );
                            }
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        future: getCust(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
