class TaxInfo {
  double income;
  String filingStatus;
  int dependents;
  double deductions;
  double taxCredit;
  double otherIncome;
  double investmentIncome;
  double educationalExpenses;

  TaxInfo({
    required this.income,
    required this.filingStatus,
    required this.dependents,
    required this.deductions,
    required this.taxCredit,
    required this.otherIncome,
    required this.investmentIncome,
    required this.educationalExpenses,
  });

  TaxInfo.copyWith(TaxInfo original, {
    double? income,
    String? filingStatus,
    int? dependents,
    double? deductions,
    double? taxCredit,
    double? otherIncome,
    double? investmentIncome,
    double? educationalExpenses,
  }) : this(
    income: income ?? original.income,
    filingStatus: filingStatus ?? original.filingStatus,
    dependents: dependents ?? original.dependents,
    deductions: deductions ?? original.deductions,
    taxCredit: taxCredit ?? original.taxCredit,
    otherIncome: otherIncome ?? original.otherIncome,
    investmentIncome: investmentIncome ?? original.investmentIncome,
    educationalExpenses: educationalExpenses ?? original.educationalExpenses,
  );
}
