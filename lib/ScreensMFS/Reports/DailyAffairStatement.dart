import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import 'package:get/get.dart';
import '../../Constants/values.dart';
import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../helpers/pdfs_helpers/pdf_dailyaffairstatementledger.dart';
import '../../helpers/pdfs_helpers/pdf_dailytransactionledger.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/TransactionList.dart';

class DailyAffairStatement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DailyAffairStatement({required this.appbool, required this.navbool});

  @override
  State<DailyAffairStatement> createState() => _DailyAffairStatementState();
}

class _DailyAffairStatementState extends State<DailyAffairStatement> {
  DateTime _selectedDate = DateTime.now();


  double calculateSum(List<dynamic> array) {
    return array.fold(0, (sum, map) => sum + (map['value'] as double? ?? 0));
  }

  Future<List<DailyTransactionModel>> getmemberdeposit() async {
    List<DailyTransactionModel> allmemberss = [];
    double totaldepo = 0;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Member')
        .where('Deposits')
        .get();
    for (var document in querySnapshot.docs) {
      List<dynamic> deposits = document["Deposits"];
      for (int i = 0; i < deposits.length; i++) {
        DateTime ddd = DateTime.parse(deposits[i]["date"]);
        if (_selectedDate.day == ddd.day &&
            _selectedDate.month == ddd.month &&
            _selectedDate.year == ddd.year) {
        totaldepo += deposits[i]["value"] ?? 0.0;
        }
      }
    }
    allmemberss.add(DailyTransactionModel(
        amount: totaldepo,
        transacno: '52001002',
        drcr: true,
        acno: '1',
        actitle: '',
        naration: "Short Notice Deposit (Samittee)",
        transactiondate: DateTime.now()));
    allmemberss.add(DailyTransactionModel(
        amount: 0,
        transacno: '52001003',
        drcr: true,
        acno: '1',
        actitle: '',
        naration: "Short Notice Deposit (Cbs)",
        transactiondate: DateTime.now()));
    allmemberss.add(DailyTransactionModel(
        amount: 0,
        transacno: '52001001',
        drcr: true,
        acno: '1',
        actitle: '',
        naration: "Savings Deposit",
        transactiondate: DateTime.now()));
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getmemberwithdraw() async {
    List<DailyTransactionModel> allmemberss = [];
    int i = 0;
    await FirebaseFirestore.instance
        .collection('BalanceAccount')
        .get()
        .then((que) {
      for (var ele in que.docs) {
        i++;
        allmemberss.add(DailyTransactionModel(
            amount: ele['Balance'],
            transacno: '30250${i.toString().padLeft(3,'0')}',
            drcr: true,
            acno: ele.id,
            actitle: '',
            naration: ele['Account Title'],
            transactiondate: DateTime.now()));
      }
    });
    int index = allmemberss.indexWhere((element) => element.acno == '0');
    if (index != -1) {
    var doc000 = allmemberss.removeAt(index);
    allmemberss.insert(0, doc000);
    }
    return allmemberss;
  }


  Future<List<DailyTransactionModel>> getExpense() async {
    List<DailyTransactionModel> profitloss = [];
    int s = 1;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('ExpenseItem').get();
    for (var category in ExpensecategoryList) {
      double currentmont = 0.0;
      List<QueryDocumentSnapshot<Map<String, dynamic>>> expenses = querySnapshot
          .docs
          .where((ele) => ele['Expense Category'] == category)
          .toList();
      for (var ele in expenses) {
        double amount = ele['Amount'];
        if (_selectedDate.month == ele['Date'].toDate().month &&
            _selectedDate.year == ele['Date'].toDate().year) {
          currentmont += amount;
        }
      }
      profitloss.add(DailyTransactionModel(
          amount: currentmont,
          transacno: "90100${s.toString().padLeft(3, '0')}",
          drcr: false,
          acno: '1',
          actitle: '',
          naration: category,
          transactiondate: DateTime.now()));
      s++;
    }
    return profitloss;
  }

  @override
  Widget build(BuildContext context) {

    _save() async {
        PdfDailyAffairStatementLedger.generate(
            cashwithdraw: await getmemberwithdraw(),
            cashdeposit: await getmemberdeposit(),
            expense: await getExpense(),
            ledgertitle: 'ss',
            date: _selectedDate);
    }


    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child:  Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: [
                  Container(
                    width: 1400,
                    height: 300,
                    // color: Colors.white,

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
                          width: 1400,
                          height: 40,
                          color: navbarColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Affair Statement",
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
                                  _save();
                                },
                                child: Container(
                                  height: 40,
                                  width: 125,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.0, left: 12),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye_outlined,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "View Report",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 90,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 3.0, left: 15),
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
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                color: AppColor_yellow,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 90, left: 430),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: 'Transaction Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' *',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    fontSize: 14)),
                                            TextSpan(
                                                text: ' :',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 70,
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
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                hintText: _selectedDate != null
                                                    ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                                    : "Select a date",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                suffixIcon: Icon(
                                                    Icons.calendar_month_sharp,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
