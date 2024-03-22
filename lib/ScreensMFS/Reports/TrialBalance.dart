import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../Model/dailyTransactionModel.dart';
import '../../helpers/pdfs_helpers/pdf_trialbalanceledger.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/GLSummary.dart';

class TrailBalance extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  TrailBalance({required this.appbool, required this.navbool});

  @override
  State<TrailBalance> createState() => _TrailBalanceState();
}

class _TrailBalanceState extends State<TrailBalance> {
  DateTime _selectedDate = DateTime.now();

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

  Future<List<DailyTransactionModel>> getcashinhand() async {
    List<DailyTransactionModel> allmemberss = [];
    await FirebaseFirestore.instance
        .collection('BalanceAccount')
        .doc('0')
        .get()
        .then((element) {
      allmemberss.add(DailyTransactionModel(
          amount: element['Balance'],
          transacno: '52001001',
          drcr: true,
          acno: '1',
          actitle: '',
          naration: element['Account Title'],
          transactiondate: DateTime.now()));
    });
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getcashcurrentdeposti() async {
    List<DailyTransactionModel> allmemberss = [];
    double totaldepo = 0;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Member')
        .where('Deposits')
        .get();
    for (var document in querySnapshot.docs) {
      List<dynamic> deposits = document["Deposits"];
      for (var deposit in deposits) {
        totaldepo += deposit["value"] ?? 0.0;
      }
    }
    allmemberss.add(DailyTransactionModel(
        amount: totaldepo,
        transacno: '52001002',
        drcr: true,
        acno: '1',
        actitle: '',
        naration: "Cash Deposit",
        transactiondate: DateTime.now()));
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getsavingsdeposit() async {
    List<DailyTransactionModel> allmemberss = [];
    allmemberss.add(DailyTransactionModel(
        amount: 0,
        transacno: '52002002',
        drcr: true,
        acno: '1',
        actitle: '',
        naration: "Savings Deposit",
        transactiondate: DateTime.now()));
    return allmemberss;
  }

  Future<List<DailyTransactionModel>> getloanandadvances() async {
    List<DailyTransactionModel> allmemberss = [];
    allmemberss.add(DailyTransactionModel(
        amount: 0,
        transacno: '52002003',
        drcr: true,
        acno: '1',
        actitle: '',
        naration: "Suspense(Service Charge)",
        transactiondate: DateTime.now()));
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
          transacno: "52007${s.toString().padLeft(2, '0')}",
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
      PdfTrailbalanceLedger.generate(
          cashcurrentdeposit: await getcashcurrentdeposti(),
          expenses: await getExpense(),
          cashinhand: await getcashinhand(),
          savingsdeposit: await getsavingsdeposit(),
          loanandadvances: await getloanandadvances(),
          startdate: _selectedDate);
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
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
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Trail Balance",
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
