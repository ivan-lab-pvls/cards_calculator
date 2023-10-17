import 'dart:convert';

import 'package:cards_calculator/constants.dart';
import 'package:cards_calculator/data/models/income.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomesChangeNotifier extends ChangeNotifier {
  IncomesChangeNotifier(this._shPrefs);
  final SharedPreferences _shPrefs;

  final List<Income> incomes = [];

  void addIncome(Income income) {
    incomes.add(income);
    _cacheIncomes();
    notifyListeners();
  }

  void removeIncome(int index) {
    incomes.removeAt(index);
    _cacheIncomes();
    notifyListeners();
  }

  void editIncome(int index, Income edittedIncome) {
    incomes.removeAt(index);
    incomes.insert(index, edittedIncome);
    _cacheIncomes();
    notifyListeners();
  }

  void init() {
    final encodedJsons = _shPrefs.getString(Constants.cachedIncomesKey);

    if (encodedJsons == null) return;

    final decodedJsons = jsonDecode(encodedJsons) as List<dynamic>;

    final cachedIncomes = decodedJsons.map((e) => Income.fromJson(e)).toList();
    incomes.addAll(cachedIncomes);
    notifyListeners();
  }

  void _cacheIncomes() {
    final jsons = incomes.map((e) => e.toJson()).toList();
    final encodedJsons = jsonEncode(jsons);
    _shPrefs.setString(Constants.cachedIncomesKey, encodedJsons);
  }

  int get summ {
    int amount = 0;
    for (var income in incomes) {
      amount += income.amount;
    }
    return amount;
  }
}
