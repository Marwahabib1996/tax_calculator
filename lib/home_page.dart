import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tax_info.dart';
import 'tax_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tax Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Income'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, income: double.parse(value));
              },
            ),
            SizedBox(height: 16),
            _buildFilingStatusDropdown(context),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dependents'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, dependents: int.parse(value));
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Deductions'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, deductions: double.parse(value));
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tax Credit'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, taxCredit: double.parse(value));
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Other Income'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, otherIncome: double.parse(value));
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Investment Income'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, investmentIncome: double.parse(value));
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Educational Expenses'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _updateTaxInfo(context, educationalExpenses: double.parse(value));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/result');
              },
              child: Text('Calculate Tax'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilingStatusDropdown(BuildContext context) {
    final filingStatusOptions = ['Single', 'Married', 'Head of Household'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Filing Status'),
        DropdownButton<String>(
          value: Provider.of<TaxProvider>(context).taxInfo.filingStatus,
          items: filingStatusOptions.map((status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(status),
            );
          }).toList(),
          onChanged: (value) {
            _updateTaxInfo(context, filingStatus: value);
          },
        ),
      ],
    );
  }

  void _updateTaxInfo(
      BuildContext context, {
        double? income,
        String? filingStatus,
        int? dependents,
        double? deductions,
        double? taxCredit,
        double? otherIncome,
        double? investmentIncome,
        double? educationalExpenses,
      }) {
    final taxInfo = Provider.of<TaxProvider>(context, listen: false).taxInfo;
    final newTaxInfo = TaxInfo.copyWith(taxInfo,
      income: income,
      filingStatus: filingStatus,
      dependents: dependents,
      deductions: deductions,
      taxCredit: taxCredit,
      otherIncome: otherIncome,
      investmentIncome: investmentIncome,
      educationalExpenses: educationalExpenses,
    );
    Provider.of<TaxProvider>(context, listen: false).updateTaxInfo(newTaxInfo);
  }
}