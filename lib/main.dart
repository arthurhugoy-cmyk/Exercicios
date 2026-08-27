import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// App principal
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mesada(),
    );
  }
}

class Mesada extends StatefulWidget {
  const Mesada({super.key});

  @override
  State<Mesada> createState() => _MesadaState();
}

//vincula a variavel com o input
class _MesadaState extends State<Mesada> {
  final TextEditingController mesadaController =
      TextEditingController();

  final TextEditingController guardarController =
      TextEditingController();

  final TextEditingController lanchesController =
      TextEditingController();

  final TextEditingController lazerController =
      TextEditingController();

  double totalGastos = 0;
  double valorRestante = 0;

  void calcular() {
    double mesada =
        double.tryParse(mesadaController.text) ?? 0;

    double guardar =
        double.tryParse(guardarController.text) ?? 0;

    double lanches =
        double.tryParse(lanchesController.text) ?? 0;

    double lazer =
        double.tryParse(lazerController.text) ?? 0;

    // Total de gastos
    double gastos = lanches + lazer;

    // sobras
    double restante = mesada - guardar - gastos;

    setState(() {
      totalGastos = gastos;
      valorRestante = restante;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizador de Mesada'),
        backgroundColor: const Color.fromARGB(255, 245, 218, 127),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Valor da mesada
            TextField(
              controller: mesadaController,
              decoration: const InputDecoration(
                labelText: 'Valor da mesada',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            // Quanto pretende guardar
            TextField(
              controller: guardarController,
              decoration: const InputDecoration(
                labelText: 'Quanto pretende guardar',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            // Gastos com lanches
            TextField(
              controller: lanchesController,
              decoration: const InputDecoration(
                labelText: 'Quanto gasta com lanches',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            // Gastos com jogos ou lazer
            TextField(
              controller: lazerController,
              decoration: const InputDecoration(
                labelText: 'Quanto gasta com jogos ou lazer',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 25),

            // Botão
            ElevatedButton.icon(
              onPressed: calcular,
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
            ),

            const SizedBox(height: 30),

            // Total gasto
            Text(
              'Total gasto: R\$ ${totalGastos.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Valor restante ou faltante
            Text(
              valorRestante >= 0
                  ? 'Valor restante: R\$ ${valorRestante.toStringAsFixed(2)}'
                  : 'Valor que faltou: R\$ ${(-valorRestante).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: valorRestante >= 0
                    ? Colors.green
                    : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}