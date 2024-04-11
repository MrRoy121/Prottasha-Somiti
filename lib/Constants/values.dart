import '../Model/scheme.dart';

const List<String> UserTypeList = [
  'Super Admin',
  'Admin',
  'Branch Manager',
  'Field Officer',
];


const List<String> ProductClassList = [
  'SME Loan',
  'Term Loan',
  'Short Term Loan',
  'Staff Loan',
];
const List<String> MemberTypeList = ['General Member'];
const List<String> MaritalstatusList = ['Single', 'Married', 'Divorced'];
const List<String> ReligionList = [
  'Hinduism',
  'Islam',
  'Buddhism ',
  'Christianity',
  'Others'
];
const List<String> MobileTypeList = ['Personal', 'Other'];
const List<String> InstallmentFrequencyList = ['Daily', 'Weekly', 'Monthly'];
const List<int> SanctionLimitList = [50000, 100000, 500000, 1000000];
const List<String> LoanPeriodList = [
  'January',
  'February',
  'March ',
  'April',
  'May',
  'June',
  'July',
  'August ',
  'September',
  'October',
  'November ',
  'December'
];
const List<String> TranTypeList = [
  'All Transaction',
  'Debit Transaction',
  'Credit Transaction',
];
const List<String> SectorList = [
  '901002 - Fishing Farms(Hatchery,Shrimp Culture Etc)',
  '901003 - Dairy Farms',
  '901004 - Poultry Farms',
  '901009 - Farmers/Fishermen',
  '901010 - Business',
  '902118 - Rice Mills',
  '902133 - Bricks Manufacturers & Sand Elevators',
  '902450 - Restaurant/Fast Food',
  '902451 - Photo Studio & Color Labs',
  '902452 - Travel agencies',
  '902454 - Beauty Parlors/Saloons',
  '902462 - Stone Crasher',
  '902463 - Jewelry Service',
  '902465 - Auto Mobile Service',
  '902050 - Foreign Individual',
  '905001 - Student',
  '905002 - Housewive',
];
const List<String> DocumentList = [
  'National ID Card',
  'Passport',
  'Birth Certificate',
  'Driver License',
  'General Deed',
  'School Certificate',
  'Land Deed'
];

const List<String> IntroducerTypeList = [
  'Existing Customer',
];

const List<String> ExpensecategoryList = [
  'Others',
  'Salary (Officer)',
  'Salary (Staff)',
  'House Rent Allowance',
  'Medical Allowance',
  'Education Allowance',
  'Conveyance Allowance',
  'Bank Contribution To Pf',
  'Rest And Recreation Leave Allowance',
  'Festival Bonus',
  'Lunch Subsidy',
  'Special Benefit Allowance'
      'Training Expense',
  'Travelling Expenses (Audit And Tour)',
  'Conveyance',
  'Fuel',
  'Entertainment',
  'Business Development',
  'Newspaper & Journal',
  'Bank Charge',
  'Electricity Cost',
  'Printed Stationary',
  'Internet Expense',
  'Miscellaneous Expenses',
  'Table Stationary',
  'Mobile Bill',
];
const List<String> TransactionNatureList = [
  'GL to GL',
  'GL to Party Account',
  'Party Account to GL',
  'Party Account to Party Account',
];
const List<String> TransactionentrytypeList = [
  'New Entry',
];

const List<Map<String, String>> IntroducerList = [
  {'ID': '7210220058837101', 'Name': 'Titas Ranjan Talukdar'}
];

const List<String> RelationList = [
  'Wife',
  'Husband',
  'Son',
  'Daughter',
  'Father',
  'Mother',
];
const List<String> LoanPurposeList = [
  'Business',
  'Rickshaw',
  'Van',
  'Motor Cycle',
  'Others',
  'Flower Farming',
  'Tailor Training',
  'Bee Farming'
];
const List<String> LoanType = [
  'Staff Loan',
  'SOD Loan',
  'General Loan',
  'Micro Credit',
  'Share Holder Loan'
];
const List<String> ReverseTypeList = [
  'Full Reverse',
  'Partial Reverse',
];

const List<String> CustomerTypeList = [
  'Individual',
];

List<String> CustomerRegi = [
  "Selection",
  'Basic Info',
  'Customer Photo',
  'Address\nInformation',
  'Contact\nInformation',
  'Related\nDocuments',
  'Bank\nA/C Info',
  'Know Your\nCustomer',
  'Review'
];

List<String> RegularAccopen = [
  "Account Type",
  'Account Information',
  'Account Operator',
  'Nominee\nInformation',
  'Introducer\nInformation',
  'Transaction\nProfile',
  'Know Your\nCustomer',
  'Final Submission'
];
const List<String> LedgerTypeList = [
  'Member Deposit Ledger',
  'Member Loan Ledger',
];
List<Scheme> LoanSchemes = [
  Scheme(
      sl: 1,
      installmentno: 106,
      duration: 131,
      prinamount: 10000,
      servicecharge: 6.00,
      dailyprofit: 5.66,
      profitamount: 5.66,
      yearlyprofit: 16.72,
      totalprofit: 600,
      installmentrate: 1.00,
      installmentamount: 100,
      dailyprincipleamount: 94.34,
      total: 10600,
      name: "Micro 1"),
  Scheme(
      sl: 2,
      installmentno: 119,
      duration: 147,
      prinamount: 10000,
      servicecharge: 7.10,
      dailyprofit: 6.63,
      yearlyprofit: 17.63,
      profitamount: 5.97,
      totalprofit: 710,
      installmentrate: 0.90,
      installmentamount: 90,
      dailyprincipleamount: 84.03,
      total: 10710,
      name: "Micro 2"),
  Scheme(
      sl: 3,
      installmentno: 135,
      duration: 166,
      prinamount: 10000,
      servicecharge: 8.00,
      dailyprofit: 7.41,
      yearlyprofit: 17.59,
      profitamount: 5.93,
      totalprofit: 800,
      installmentrate: 0.80,
      installmentamount: 80,
      dailyprincipleamount: 74.07,
      total: 10800,
      name: "Micro 3"),
  Scheme(
      sl: 4,
      installmentno: 156,
      duration: 192,
      prinamount: 10000,
      servicecharge: 9.20,
      dailyprofit: 8.42,
      yearlyprofit: 17.49,
      profitamount: 5.89,
      totalprofit: 920,
      installmentrate: 0.70,
      installmentamount: 70,
      dailyprincipleamount: 64.11,
      total: 10920,
      name: "Micro 4"),
  Scheme(
      sl: 5,
      installmentno: 185,
      duration: 228,
      prinamount: 10000,
      servicecharge: 11.00,
      dailyprofit: 9.91,
      yearlyprofit: 17.61,
      profitamount: 5.95,
      totalprofit: 1100,
      installmentrate: 0.60,
      installmentamount: 60,
      dailyprincipleamount: 54.05,
      total: 11100,
      name: "Micro 5"),
  Scheme(
      sl: 6,
      installmentno: 227,
      duration: 280,
      prinamount: 10000,
      servicecharge: 13.50,
      dailyprofit: 11.89,
      yearlyprofit: 17.60,
      profitamount: 5.95,
      totalprofit: 1350,
      installmentrate: 0.50,
      installmentamount: 50,
      dailyprincipleamount: 44.06,
      total: 11350,
      name: "Micro 6"),
  Scheme(
      sl: 7,
      installmentno: 257,
      duration: 317,
      prinamount: 10000,
      servicecharge: 15.65,
      dailyprofit: 13.53,
      yearlyprofit: 18.02,
      profitamount: 6.09,
      totalprofit: 1565,
      installmentrate: 0.45,
      installmentamount: 45,
      dailyprincipleamount: 38.91,
      total: 11565,
      name: "Micro 7"),
  Scheme(
      sl: 8,
      installmentno: 294,
      duration: 362,
      prinamount: 10000,
      servicecharge: 17.60,
      dailyprofit: 14.97,
      yearlyprofit: 17.75,
      profitamount: 5.99,
      totalprofit: 1760,
      installmentrate: 0.40,
      installmentamount: 40,
      dailyprincipleamount: 34.01,
      total: 11760,
      name: "Micro 8"),
  Scheme(
      sl: 9,
      installmentno: 345,
      duration: 425,
      prinamount: 10000,
      servicecharge: 20.75,
      dailyprofit: 17.18,
      yearlyprofit: 17.82,
      profitamount: 6.01,
      totalprofit: 2075,
      installmentrate: 0.35,
      installmentamount: 35,
      dailyprincipleamount: 28.99,
      total: 12075,
      name: "Micro 9"),
  Scheme(
      sl: 10,
      installmentno: 418,
      duration: 515,
      prinamount: 10000,
      servicecharge: 25.40,
      dailyprofit: 20.26,
      yearlyprofit: 18.00,
      profitamount: 6.08,
      totalprofit: 2540,
      installmentrate: 0.30,
      installmentamount: 30,
      dailyprincipleamount: 23.92,
      total: 12540,
      name: "Micro 10"),
];
