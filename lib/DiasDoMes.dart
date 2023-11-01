import 'package:controleatividadespordia/ListaAtividadesDia.dart';
import 'package:flutter/material.dart';

import 'Atividade.dart';
import 'CadastroAtividade.dart';

class DiasDoMes extends StatelessWidget {
  final String month;
  final int indice;
  final int mesAtualNumero;
  final int anoAtual;
  final List<Atividade> atividades;

  Map<int, Atividade> atividadesPorDia = <int, Atividade>{};

  List<Atividade> atividadesFiltradas = [];

  DiasDoMes(
    this.month,
    this.indice,
    this.mesAtualNumero,
    this.anoAtual,
    this.atividades,
  );

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int anoAtual = now.year;

    // Calcular o primeiro dia do mês e o número de dias no mês
    DateTime firstDayOfMonth = DateTime(anoAtual, mesAtualNumero, 1);
    int daysInMonth = DateTime(anoAtual, mesAtualNumero + 1, 0).day;
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.7),
        title: Text('${month} de $anoAtual',
            style: const TextStyle(color: Colors.white)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          // Calcular o dia atual
          int day = index - weekdayOfFirstDay + 1;

          final DateTime date = DateTime(anoAtual, mesAtualNumero, day);
          final int diaDaSemana = date.weekday;
          String diaDaSemanaNome = descobreNomeDiaSemana(diaDaSemana);
          Color color = descobreCorDia(diaDaSemanaNome);

          if (day <= 0 || day > daysInMonth) {
            // Exibir um dia vazio se estiver fora do mês
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                //border: Border.all(color: Colors.grey),
              ),
              child: const Center(child: Text('')),
            );
          } else {
            if (atividades.isNotEmpty) {
              filtrarAtividadesPorMes(mesAtualNumero);
              String descricao = '';
              Atividade? atividadeDoDia = atividadesPorDia[day];
              if (atividadeDoDia != null) {
                descricao = atividadeDoDia.titulo;
              } else {
                descricao = '';
              }
              return Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child:  ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text('Dia $day - $diaDaSemanaNome\n')),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(child: Text(descricao),),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ListaAtividadesDia(atividadesFiltradas.where((atividade) => atividade.dia == day).toList()),
                              ),
                            );
                          },
                          child: Visibility(
                            visible:
                                descricao != '',
                            child: Icon(
                              Icons.search,
                              color: Colors.pink.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CadastroAtividade(
                              day: day,
                              month: month,
                              mesAtualNumero: mesAtualNumero,
                              anoAtual: anoAtual,
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.pink.withOpacity(0.7),
                      ),
                    ),
                  ),

              );
            } else {
              Container(
                child: const Text('Teste'),
              );
            }
          }
        },
        itemCount: daysInMonth + weekdayOfFirstDay,
      ),
    );
  }

  void filtrarAtividadesPorMes(int mesDesejado) {
    atividadesFiltradas =
        atividades.where((atividade) => atividade.mes == mesDesejado).toList();
    for (final atividade in atividadesFiltradas) {
      atividadesPorDia[atividade.dia] = atividade;
    }
  }

  String obterAtividadesPorDia(List<Atividade> atividades, int diaDesejado) {
    final atividadesDoDia = atividades
        .where((atividade) => atividade.dia == diaDesejado)
        .map((atividade) => atividade.titulo)
        .toList();

    if (atividadesDoDia.isEmpty) {
      return 'Nenhuma atividade registrada';
    } else {
      return atividadesDoDia
          .join(', '); // Une os títulos com uma vírgula e espaço
    }
  }

  String descobreNomeDiaSemana(int diaDaSemana) {
    String diaDaSemanaNome;
    if (diaDaSemana == DateTime.sunday) {
      diaDaSemanaNome = 'Domingo';
    } else {
      diaDaSemanaNome = descobreDiaDaSemana[diaDaSemana];
    }
    return diaDaSemanaNome;
  }

  Color descobreCorDia(String diaDaSemanaNome) {
    Color color;
    if (diaDaSemanaNome == 'Sábado' || diaDaSemanaNome == 'Domingo') {
      color = Colors.orangeAccent.withOpacity(0.7);
    } else {
      color = const Color(0xFFcadefc);
    }
    return color;
  }

  List<String> descobreDiaDaSemana = [
    'Domingo',
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
  ];

  bool mesComecaEmDomingo(int year, int month) {
    DateTime primeiroDiaDoMes = DateTime(year, month, 1);
    return primeiroDiaDoMes.weekday == DateTime.sunday;
  }
}
