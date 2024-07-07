import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensCBS/Reports/Widgets/GLSummary.dart';
import 'package:prottashasomit/helpers/pdfs_helpers/pdf_glSummaryledger.dart';
import '../../../../Constants/Constants.dart';
import 'package:get/get.dart';
import '../../Constants/values.dart';
import '../../Model/dailyTransactionModel.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../../helpers/pdfs_helpers/pdf_dailytransactionledger.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import 'Widgets/TransactionList.dart';

class DailyGLSummary extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  DailyGLSummary({required this.appbool, required this.navbool});

  @override
  State<DailyGLSummary> createState() => _DailyGLSummaryState();
}

class _DailyGLSummaryState extends State<DailyGLSummary> {
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDate1 = DateTime.now();
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;
  bool samiteeselected = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance.collection('Somitee').get().then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            name: element["Name"],
            active: element["Active"],
            closed: element["Closed"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      selectedsomiti = ss;
      samiteeselected = false;
    });
  }

  double calculateSum(List<dynamic> array) {
    return array.fold(0, (sum, map) => sum + (map['value'] as double? ?? 0));
  }

  Future<Map<String, List<DailyTransactionModel>>> getTransactions(DateTime startDate, DateTime endDate) async {
    List<DailyTransactionModel> memberDeposits = [];
    List<DailyTransactionModel> memberWithdraws = [];
    List<DailyTransactionModel> expenses = [];
    List<DailyTransactionModel> incomes = [];
    List<DailyTransactionModel> loanDisbursements = [];
    List<DailyTransactionModel> loanRepayments = [];
    int s = 1;

    bool isDateInRange(DateTime date, DateTime start, DateTime end) {
      DateTime dateOnly = DateTime(date.year, date.month, date.day);
      DateTime startOnly = DateTime(start.year, start.month, start.day);
      DateTime endOnly = DateTime(end.year, end.month, end.day);
      return dateOnly.isAfter(startOnly.subtract(Duration(days: 1))) &&
          dateOnly.isBefore(endOnly.add(Duration(days: 1)));
    }

    try {
      QuerySnapshot memberQuerySnapshot = await FirebaseFirestore.instance.collection('Member').get();
      for (var element in memberQuerySnapshot.docs) {
        if (element["Deposits"] != null) {
          var deposits = element["Deposits"] ?? [];
          for (var deposit in deposits) {
            DateTime depositDate = DateTime.parse(deposit["date"]);
            if (isDateInRange(depositDate, startDate, endDate)) {
              memberDeposits.add(DailyTransactionModel(
                  amount: deposit["value"],
                  transacno: s.toString(),
                  drcr: false,
                  acno: element.id,
                  actitle: element["First Name"] + " " + element["Last Name"],
                  naration: deposit["remarks"],
                  transactiondate: depositDate));
              s++;
            }
          }
        }

        // Fetch Withdrawals
        if (element["Withdraws"] != null) {
          var withdrawals = element["Withdraws"] ?? [];
          for (var withdrawal in withdrawals) {
            DateTime withdrawalDate = DateTime.parse(withdrawal["date"]);
            if (isDateInRange(withdrawalDate, startDate, endDate)) {
              memberWithdraws.add(DailyTransactionModel(
                  amount: withdrawal["value"],
                  transacno: s.toString(),
                  drcr: true,
                  acno: element.id,
                  actitle: element["First Name"] + " " + element["Last Name"],
                  naration: withdrawal["remarks"],
                  transactiondate: withdrawalDate));
              s++;
            }
          }
        }
      }

      QuerySnapshot<Map<String, dynamic>> expenseQuerySnapshot =
          await FirebaseFirestore.instance.collection('ExpenseItem').get();
      for (var category in ExpensecategoryList) {
        double currentmont = 0.0;
        List<QueryDocumentSnapshot<Map<String, dynamic>>> expensesList =
            expenseQuerySnapshot.docs.where((ele) => ele['Expense Category'] == category).toList();
        for (var expense in expensesList) {
          DateTime expenseDate = expense['Date'].toDate();
          if (isDateInRange(expenseDate, startDate, endDate)) {
            double amount = expense['Amount'];
            currentmont += amount;
          }
        }
        if (currentmont != 0) {
          expenses.add(DailyTransactionModel(
              amount: currentmont,
              transacno: s.toString(),
              drcr: false,
              acno: '1',
              actitle: '',
              naration: category,
              transactiondate: endDate));
          s++;
        }
      }

      QuerySnapshot<Map<String, dynamic>> incomeQuerySnapshot =
          await FirebaseFirestore.instance.collection('Others Fee').get();
      for (var member in incomeQuerySnapshot.docs) {
        String memberName = member['Member Name'];
        for (var category in feeTypes) {
          if (member.data().containsKey(category)) {
            var feeDetails = member[category];
            if (feeDetails is Map<String, dynamic>) {
              double currentMonthIncome = 0.0;
              if (feeDetails['amount'] != null && feeDetails['date'] != null) {
                try {
                  DateTime feeDate = feeDetails['date'].toDate();
                  double amount = double.parse(feeDetails['amount']);
                  if (isDateInRange(feeDate, startDate, endDate)) {
                    currentMonthIncome += amount;
                  }
                } catch (e) {
                  print('Error processing fee data: $e');
                }
              }
              if (currentMonthIncome != 0) {
                incomes.add(DailyTransactionModel(
                  amount: currentMonthIncome,
                  transacno: s.toString(),
                  drcr: true,
                  acno: '1',
                  actitle: memberName,
                  naration: category,
                  transactiondate: endDate,
                ));
                s++;
              }
            }
          }
        }
      }

      QuerySnapshot loanDisbursementQuerySnapshot = await FirebaseFirestore.instance.collection('LoanDisbursed').get();
      for (var element in loanDisbursementQuerySnapshot.docs) {
        if (element['Status'] && element['Approve']) {
          DateTime disbursedDate = element["Disbursed Date"].toDate();
          if (isDateInRange(disbursedDate, startDate, endDate)) {
            loanDisbursements.add(DailyTransactionModel(
                amount: element["Disbursed Amount"],
                transacno: s.toString(),
                drcr: true,
                acno: element['Member ID'],
                actitle: element["Member Name"],
                naration: element["Narration"],
                transactiondate: disbursedDate));
            s++;
          }
        }
      }

      QuerySnapshot loanRepaymentQuerySnapshot = await FirebaseFirestore.instance.collection('LoanRepayment').get();
      for (var element in loanRepaymentQuerySnapshot.docs) {
        if (element['Status'] && element['Approve']) {
          DateTime repaymentDate = element["Request Date"].toDate();
          if (isDateInRange(repaymentDate, startDate, endDate)) {
            loanRepayments.add(DailyTransactionModel(
                amount: element["Pay Amount"],
                transacno: s.toString(),
                drcr: false,
                acno: element['Member ID'],
                actitle: element["Member Name"],
                naration: element["Narration"],
                transactiondate: repaymentDate));
            s++;
          }
        }
      }
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }

    return {
      '0': memberDeposits,
      '1': memberWithdraws,
      '2': expenses,
      '3': incomes,
      '4': loanDisbursements,
      '5': loanRepayments,
    };
  }

  bool isDateInRange(DateTime date, DateTime start, DateTime end) {
    DateTime dateOnly = DateTime(date.year, date.month, date.day);
    DateTime startOnly = DateTime(start.year, start.month, start.day);
    DateTime endOnly = DateTime(end.year, end.month, end.day);
    return dateOnly.isAfter(startOnly.subtract(const Duration(days: 1))) &&
        dateOnly.isBefore(endOnly.add(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
        samiteeselected = true;
      });
    }

    _save() async {
      if (selectedsomiti == null) {
        Get.snackbar("Samitee Wise Member Ledger Report Generation Failed.", "Some Required Fields are Empty",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              BoxShadow(color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      } else {
        Map<String, List<DailyTransactionModel>> myss = await getTransactions(_selectedDate1, _selectedDate);
        PdfGlsummaryLedger.generate(
            cashwithdraw: myss['1']!,
            cashdeposit: myss['0']!,
            loandisburse: myss['4']!,
            loanrepayment: myss['5']!,
            getexpense: myss['2']!,
            getincome: myss['3']!,
            ledgertitle: selectedsomiti.name,
            startdate: _selectedDate1,
            enddate: _selectedDate,
            ledgeno: selectedsomiti.id);
      }
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

    Future<void> _selectDate1(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate1 ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedDate1) {
        setState(() {
          _selectedDate1 = picked;
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
              margin: EdgeInsets.only(top: 100, left: 50),
              child: GLSummary(
                ssomitee: ssomitee,
                setupsomiti: _setupsomiti,
                selectDate: _selectDate,
                selectedDate: _selectedDate,
                selectDate1: _selectDate1,
                selectedDate1: _selectedDate1,
                selectedsomiteeid: selectedsomiti,
                selectedsomitee: sselectedsomiti,
                onsubmit: _save,
                onclear: _onclear,
                somitee: somitee,
              ),
            ),
            NavbarScreenCBS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
