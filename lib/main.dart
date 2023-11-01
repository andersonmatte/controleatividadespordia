import 'package:flutter/material.dart';

import 'Atividade.dart';
import 'DiasDoMes.dart';
import 'HiveData.dart';
import 'HiveService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveData.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<Atividade> atividades = [];

  final List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.7),
        title: const Text('Calendário Registro de Atividades',
            style: TextStyle(color: Colors.white)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 150, right: 150, top: 50),
        itemCount: months.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final month = months[index];
          int indice = descobreIndice(month);
          int mesAtualNumero = descobreMesAtualNumero(month);
          buscaRegistros(mesAtualNumero);
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFcadefc),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: ListTile(
                title: Center(
                  child: Text(month,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiasDoMes(month, indice,
                          mesAtualNumero, descobreAnoAtual(), atividades),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> buscaRegistros(int mesAtualNumero) async {
    final atividadesRecebidas = await HiveService.recuperarAtividades();
    if (atividadesRecebidas != null) {
      atividades = atividadesRecebidas;
    } else {
      print('Nenhuma atividade encontrada.');
    }
  }

  int descobreIndice(String month) {
    int indice = 0;
    if (month == 'Janeiro' ||
        month == 'Março' ||
        month == 'Maio' ||
        month == 'Julho' ||
        month == 'Agosto' ||
        month == 'Outubro' ||
        month == 'Dezembro') {
      indice = 31;
    } else if (month == 'Fevereiro') {
      if (anoBissesto()) {
        indice = 29;
      } else {
        indice = 28;
      }
    } else {
      indice = 30;
    }
    return indice;
  }

  bool anoBissesto() {
    int anoAtual = descobreAnoAtual();
    return (anoAtual % 4 == 0 && anoAtual % 100 != 0) || anoAtual % 400 == 0;
  }

  int descobreAnoAtual() {
    DateTime now = DateTime.now();
    int anoAtual = now.year;
    return anoAtual;
  }

  int descobreMesAtualNumero(String month) {
    switch (month.toLowerCase()) {
      case 'janeiro':
        return 1;
      case 'fevereiro':
        return 2;
      case 'março':
        return 3;
      case 'abril':
        return 4;
      case 'maio':
        return 5;
      case 'junho':
        return 6;
      case 'julho':
        return 7;
      case 'agosto':
        return 8;
      case 'setembro':
        return 9;
      case 'outubro':
        return 10;
      case 'novembro':
        return 11;
      case 'dezembro':
        return 12;
      default:
        return 0;
    }
  }
}
