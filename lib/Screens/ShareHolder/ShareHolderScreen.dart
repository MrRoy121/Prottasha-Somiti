import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/route.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../Model/member.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';

class ShareHolderScreen extends StatefulWidget {
  Appbool appbool;

  ShareHolderScreen({required this.appbool});

  @override
  State<ShareHolderScreen> createState() => _ShareHolderScreenState();
}

class _ShareHolderScreenState extends State<ShareHolderScreen> {
  var selectedmemberss;
  DateTime selectedDate = DateTime.now();
  var amounttxt = TextEditingController();
  String electeddate = '';
  bool click = false;
  List<Memberss> memberss = [];
  List<Map<String, dynamic>> shareholderDetails = [];
  List<Map<String, dynamic>> memdata = [];

  getTransactionsForMember(String memberId) async {
    try {
      DocumentSnapshot memberSnapshot = await FirebaseFirestore.instance.collection('Share Holder').doc(memberId).get();

      if (memberSnapshot.exists) {
        Map<String, dynamic>? memberData = memberSnapshot.data() as Map<String, dynamic>?;
        if (memberData != null) {
          memdata = List<Map<String, dynamic>>.from(memberData['transactions'] ?? []);
          setState(() {});
        }
      } else {
        print('Member document not found for ID: $memberId');
      }
    } catch (e) {
      print('Error fetching transactions for member: $e');
    }
  }

  Future<void> fetch() async {
    QuerySnapshot shareholderSnapshot = await FirebaseFirestore.instance.collection('Share Holder').get();
    shareholderSnapshot.docs.forEach((doc) {
      shareholderDetails.add({
        'id': doc.id,
        'enable': doc.data() != null && (doc.data() as Map<String, dynamic>)['enable'] == true,
      });
    });

    for (var shareholderDetail in shareholderDetails) {
      if (shareholderDetail['enable']) {
        DocumentSnapshot memberSnapshot =
            await FirebaseFirestore.instance.collection('Member').doc(shareholderDetail['id']).get();
        if (memberSnapshot.exists && memberSnapshot['Status']) {
          memberss.add(Memberss(
            somiteename: memberSnapshot["Somitee Name"],
            somiteeid: memberSnapshot["Somitee ID"],
            membertype: memberSnapshot["Member Type"],
            occupation: memberSnapshot["Occupation"],
            fee: memberSnapshot["Fee"],
            firstname: memberSnapshot["First Name"],
            dead: memberSnapshot['Dead'],
            lastname: memberSnapshot["Last Name"],
            fathername: memberSnapshot["Father Name"],
            mothername: memberSnapshot["Mother Name"],
            gender: memberSnapshot["Gender"],
            religion: memberSnapshot["Religion"],
            nationalid: memberSnapshot["National ID"],
            loanpendingamount: memberSnapshot["Loan Pending Amount"],
            owndepositamount: memberSnapshot["Own deposit Amount"],
            birthregi: memberSnapshot["Birth Registration"],
            annualincome: memberSnapshot["Annual Income"],
            sts: memberSnapshot["Status"],
            age: memberSnapshot["Age"],
            education: memberSnapshot["Education"],
            maritalstatus: memberSnapshot["Marital Status"],
            mobilenotype: memberSnapshot["Mobile No Type"],
            mobilenno: memberSnapshot["Mobile No"],
            presentadd: memberSnapshot["Present Address"],
            parmaadd: memberSnapshot["Permanent Address"],
            livingperiod: memberSnapshot["Living Period"],
            nomaleearner: memberSnapshot["No Female Earner"],
            nofemaleearner: memberSnapshot["No Male Earner"],
            id: memberSnapshot.id,
            headfamily: memberSnapshot["Head Family"],
            ownhomestead: memberSnapshot["Own HomeStead"],
            relationwithhead: memberSnapshot["Relation With Head"],
            landdesc: memberSnapshot["Land Desc"],
            remarks: memberSnapshot["Remarks"],
            imageurl: memberSnapshot["ImageURL"],
            img: memberSnapshot["Image"],
            birthdate: memberSnapshot["Date Of Birth"].toDate(),
            sl: 0,
          ));
        }
      }
    }
  }
  // Future<void> fetch() async {
  //   _expenses = [];
  //   int i = 0;
  //   await FirebaseFirestore.instance.collection('ExpenseItem').get().then((que) {
  //     for (var ele in que.docs) {
  //       i++;
  //       _expenses.add({
  //         'ctgry': ele['Expense Category'],
  //         'amount': ele['Amount'],
  //         'Date': ele['Date'].toDate(),
  //         'sl': i,
  //       });
  //     }
  //     setState(() {});
  //   });
  // }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, right: 30, left: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      height: 400,
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
                            height: 40,
                            color: navbarColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "Add New Share",
                                    style: TextStyle(
                                      color: AppColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    if (selectedmemberss == null || amounttxt.text.isEmpty) {
                                      Get.snackbar("Share Adding Failed.", "Some Required Fields are Empty",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.zero,
                                          duration: const Duration(milliseconds: 2000),
                                          boxShadows: [
                                            const BoxShadow(
                                                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                          ],
                                          borderRadius: 0);
                                    } else {
                                      Map<String, dynamic> transactionData = {
                                        'date': selectedDate,
                                        'amount': double.parse(amounttxt.text.toString()),
                                        'drcr': false,
                                      };
                                      FirebaseFirestore.instance
                                          .collection('Share Holder')
                                          .doc(selectedmemberss.id)
                                          .update({
                                        'transactions': FieldValue.arrayUnion([transactionData]),
                                      }).then((value) async {
                                        final balanceAccountRef =
                                            FirebaseFirestore.instance.collection('BalanceAccount').doc('0');
                                        await balanceAccountRef.update({
                                          'Balance': FieldValue.increment(double.parse(amounttxt.text.toString())),
                                        });
                                        var ss;
                                        selectedDate = DateTime.now();
                                        selectedmemberss = ss;
                                        amounttxt.text = '';
                                        fetch();
                                        Get.snackbar("Added Shared Balance Successfully.", "Refreshing the Page.",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.green,
                                            margin: EdgeInsets.zero,
                                            duration: const Duration(milliseconds: 2000),
                                            boxShadows: [
                                              const BoxShadow(
                                                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                            ],
                                            borderRadius: 0);
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 90,
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0, left: 15),
                                      child: Text(
                                        "✓ Submit",
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    var ss;
                                    selectedDate = DateTime.now();
                                    selectedmemberss = ss;
                                    amounttxt.text = '';
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 90,
                                    color: AppColor_yellow,
                                    child: const Padding(
                                      padding: EdgeInsets.only(top: 3.0, left: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.clear_all_sharp,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Clear",
                                            style: TextStyle(color: Colors.white, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Select Expense Category',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                            TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                            color: AppColor_greyBorder,
                                            border: Border.all(color: AppColor_Black),
                                          ),
                                          child: DropdownSearch<Memberss>(
                                            filterFn: (Memberss item, String query) {
                                              return item.filterFn(query);
                                            },
                                            popupProps: PopupProps.menu(
                                              showSearchBox: true,
                                              itemBuilder: (BuildContext context, Memberss item, bool isSelected) {
                                                return Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Text(
                                                    "${item.firstname} ${item.lastname} - ${item.id}",
                                                  ),
                                                );
                                              },
                                              fit: FlexFit.loose,
                                              showSelectedItems: false,
                                              menuProps: const MenuProps(
                                                backgroundColor: Colors.white,
                                                elevation: 100,
                                              ),
                                              searchFieldProps: const TextFieldProps(
                                                style: TextStyle(fontSize: 12),
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: "Search...",
                                                ),
                                              ),
                                            ),
                                            dropdownDecoratorProps: const DropDownDecoratorProps(
                                              dropdownSearchDecoration: InputDecoration(
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.transparent),
                                                ),
                                                focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.transparent),
                                                ),
                                              ),
                                            ),
                                            dropdownBuilder: (context, item) {
                                              if (item == null) {
                                                return const Text(
                                                  "Enter Member Name/Code",
                                                );
                                              } else {
                                                return Text(
                                                  "${item.firstname} ${item.lastname} - ${item.id}",
                                                );
                                              }
                                            },
                                            onChanged: (newValue) {
                                              getTransactionsForMember(newValue!.id);
                                              setState(() {
                                                selectedmemberss = newValue;
                                              });
                                            },
                                            items: memberss,
                                            selectedItem: selectedmemberss,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Amount',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                            TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 110,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextField(
                                          controller: amounttxt,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Date',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                            TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: InkWell(
                                          onTap: () => _selectDate(context),
                                          child: AbsorbPointer(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey),
                                                ),
                                                hintText: selectedDate != null
                                                    ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                                                    : "Select a date",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                                suffixIcon:
                                                    Icon(Icons.calendar_month_sharp, size: 14, color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: 250,
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
                            height: 40,
                            color: navbarColor,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "All Shares List",
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
                          const SizedBox(
                            height: 25,
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: DataTable(
                              showCheckboxColumn: false,
                              border: TableBorder.all(color: Colors.black26, width: 1),
                              headingRowColor: MaterialStateProperty.all<Color>(AppColor_Blue),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'SL',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),DataColumn(
                                  label: Text(
                                    'Status',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Amount',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                              rows: [
                                for (int i = 0; i<memdata.length;i++)
                                  DataRow(
                                    cells: [
                                      DataCell(Text((i+1).toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(DateFormat.yMMMMd().format(memdata[i]["date"].toDate()),
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(Text(memdata[i]["drcr"]?"Withdrawn":"Deposited",
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(Text(memdata[i]["amount"].toStringAsFixed(1),
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                    ],
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
