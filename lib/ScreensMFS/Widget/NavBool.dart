class Navbool{

  bool memberManagement, transaction, loan, reports, accounts, employee, samiteemanagement, calculators, specialConsideration;

  Navbool(this.accounts, this.calculators, this.employee, this.loan, this.memberManagement, this.reports, this.samiteemanagement, this.specialConsideration, this.transaction);

  makeallfalse(){
    memberManagement = false;
    transaction = false;
    loan = false;
    reports = false;
    accounts = false;
    employee = false;
    samiteemanagement = false;
    calculators = false;
    specialConsideration = false;
  }
}