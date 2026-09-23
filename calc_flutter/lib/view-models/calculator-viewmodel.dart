// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../models/calculator_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorModel _model = CalculatorModel();

  String get display => _model.display;

  final List<String> botoes = [
    'C',
    '⌫',
    '/',
    'x',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '=',
    '0',
    '.',
    '%',
    '()',
  ];

  void pressionarBotao(String valor) {
    if (valor.isEmpty) return;
    _model.processarEntrada(valor);
    notifyListeners();
  }

  bool isOperador(String valor) {
    return ['+', '-', 'x', '/', '=', 'C', '⌫', '%', '( )'].contains(valor);
  }
}
