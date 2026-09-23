import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view-models/calculator-viewmodel.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CalculatorViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF121212),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
          child: Column(
            children: [
              // Display compacto
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  color: Colors.black,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      viewModel.display,
                      style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              // Grade de Botões
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF121212),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.botoes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.1,
                        ),
                    itemBuilder: (context, index) {
                      final texto = viewModel.botoes[index];
                      final ehOperador = viewModel.isOperador(texto);

                      return ElevatedButton(
                        onPressed: () => viewModel.pressionarBotao(texto),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ehOperador
                              ? const Color(0xFF7B1FA2)
                              : const Color(0xFF1E1E1E),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: ehOperador ? 4 : 1,
                        ),
                        child: Text(
                          texto,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: ehOperador
                                ? Colors.white
                                : const Color(0xFFE0E0E0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
