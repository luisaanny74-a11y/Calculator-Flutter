class CalculatorModel {
  String display = '0';
  String _operacao = '';
  double _num1 = 0;
  bool _novoNumero = true;

  void processarEntrada(String valor) {
    if (valor == 'C') {
      display = '0';
      _operacao = '';
      _num1 = 0;
      _novoNumero = true;
      return;
    }

    if (valor == '⌫') {
      if (display.length > 1) {
        display = display.substring(0, display.length - 1);
      } else {
        display = '0';
        _novoNumero = true;
      }
      return;
    }
    {
      if (valor == '%') {
        double num = double.tryParse(display) ?? 0;
        display = (num / 100).toString();
        _novoNumero = true;
        return;
      }
    }
    {
      if (valor == '( )') {
        if (display.startsWith('(') && display.endsWith(')')) {
          display = display.substring(1, display.length - 1);
        } else {
          display = '($display)';
        }
        return;
      }
    }

    if (['+', '-', 'x', '/'].contains(valor)) {
      _num1 = double.tryParse(display) ?? 0;
      _operacao = valor;
      _novoNumero = true;
      return;
    }

    if (valor == '=') {
      if (_operacao.isEmpty) return;
      double num2 = double.tryParse(display) ?? 0;
      double resultado = 0;

      switch (_operacao) {
        case '+':
          resultado = _num1 + num2;
          break;
        case '-':
          resultado = _num1 - num2;
          break;
        case 'x':
          resultado = _num1 * num2;
          break;
        case '/':
          resultado = num2 != 0 ? _num1 / num2 : 0;
          break;
        case '%':
          resultado = _num1 % num2;
          break;
        case '( )':
          resultado = _num1 * num2;
          break;
      }

      display = resultado % 1 == 0
          ? resultado.toInt().toString()
          : resultado.toString();
      _operacao = '';
      _novoNumero = true;
      return;
    }

    if (_novoNumero) {
      display = valor;
      _novoNumero = false;
    } else {
      display = display == '0' ? valor : display + valor;
    }
  }
}
