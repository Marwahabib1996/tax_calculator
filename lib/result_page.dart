import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tax_calculator/tax_info.dart';
import 'tax_provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taxInfo = Provider.of<TaxProvider>(context).taxInfo;
    final calculatedTax = _calculateTax(taxInfo);

    return Scaffold(
      appBar: AppBar(title: Text('Tax Result')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Income: ${taxInfo.income}'),
            Text('Filing Status: ${taxInfo.filingStatus}'),
            Text('Dependents: ${taxInfo.dependents}'),
            Text('Deductions: ${taxInfo.deductions}'),
            Text('Tax Credit: ${taxInfo.taxCredit}'),
            Text('Other Income: ${taxInfo.otherIncome}'),
            Text('Investment Income: ${taxInfo.investmentIncome}'),
            Text('Educational Expenses: ${taxInfo.educationalExpenses}'),
            SizedBox(height: 20),
            Text('Calculated Tax: $calculatedTax'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the first screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTax(TaxInfo taxInfo) {
    // Basic tax calculation logic (for illustrative purposes)
    double taxableIncome = taxInfo.income -
        taxInfo.deductions -
        taxInfo.taxCredit +
        taxInfo.otherIncome +
        taxInfo.investmentIncome -
        taxInfo.educationalExpenses;

    // Apply a simple tax rate based on filing status
    double taxRate;
    switch (taxInfo.filingStatus) {
      case 'Single':
        taxRate = 0.2;
        break;
      case 'Married':
        taxRate = 0.15;
        break;
      case 'Head of Household':
        taxRate = 0.18;
        break;
      default:
        taxRate = 0.2;
    }

    double calculatedTax = taxableIncome * taxRate;

    return calculatedTax;
  }
}