import 'package:flutter/material.dart';
import 'tax_info.dart';

class TaxProvider with ChangeNotifier {
  TaxInfo _taxInfo = TaxInfo(
    income: 0,
    filingStatus: 'Single',
    dependents: 0,
    deductions: 0,
    taxCredit: 0,
    otherIncome: 0,
    investmentIncome: 0,
    educationalExpenses: 0,
  );

  TaxInfo get taxInfo => _taxInfo;

  void updateTaxInfo(TaxInfo newTaxInfo) {
    _taxInfo = TaxInfo.copyWith(_taxInfo, // Use the named constructor
      income: newTaxInfo.income,
      filingStatus: newTaxInfo.filingStatus,
      dependents: newTaxInfo.dependents,
      deductions: newTaxInfo.deductions,
      taxCredit: newTaxInfo.taxCredit,
      otherIncome: newTaxInfo.otherIncome,
      investmentIncome: newTaxInfo.investmentIncome,
      educationalExpenses: newTaxInfo.educationalExpenses,
    );
    notifyListeners();
  }
