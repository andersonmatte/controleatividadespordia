import 'dart:convert';

import 'package:hive/hive.dart';

Atividade atividadeFromJson(String str) => Atividade.fromJson(json.decode(str));

String atividadeToJson(Atividade data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class Atividade extends HiveObject {
  Atividade({
    required this.titulo,
    required this.descricao,
    this.link,
    required this.responsavel,
    required this.status,
    required this.dia,
    required this.mes,
    required this.ano,
  });

  @HiveField(0)
  String titulo;

  @HiveField(1)
  String descricao;

  @HiveField(2)
  String? link;

  @HiveField(3)
  String responsavel;

  @HiveField(4)
  String status;

  @HiveField(5)
  int dia;

  @HiveField(6)
  int mes;

  @HiveField(7)
  int ano;

  factory Atividade.fromJson(Map<String, dynamic> json) => Atividade(
        titulo: json["titulo"],
        descricao: json["descricao"],
        link: json["link"],
        responsavel: json["responsavel"],
        status: json["status"],
        dia: json["dia"],
        mes: json["mes"],
        ano: json["ano"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "descricao": descricao,
        "link": link,
        "responsavel": responsavel,
        "status": status,
        "dia": dia,
        "mes": mes,
        "ano": ano,
      };
}
