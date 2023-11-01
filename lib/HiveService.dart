import 'package:controleatividadespordia/Atividade.dart';
import 'package:hive/hive.dart';

import 'Boxes.dart';

class HiveService {
  static Box atividadeBox = Boxes.getTask();

  static salvarAtividade(Atividade novaAtividade) async {
    await atividadeBox.add(novaAtividade);
  }

  static deleteAtividade(Atividade excluirAtividade) async {
    var key = excluirAtividade.key;
    await atividadeBox.delete(key);
  }

  static atualizarStatus(Atividade editarAtividade, String status) async {
    editarAtividade.status = status;
    await editarAtividade.save();
  }

  static atualizarDescricao(Atividade editarAtividade, String descricao) async {
    editarAtividade.descricao = descricao;
    await editarAtividade.save();
  }

  static atualizarAtividade(Atividade editarAtividade, String titulo,
      String descricao, String? link, String responsavel, String status) async {
    editarAtividade.titulo = titulo;
    editarAtividade.descricao = descricao;
    editarAtividade.link = link;
    editarAtividade.responsavel = responsavel;
    editarAtividade.status = status;
    await editarAtividade.save();
  }

  static recuperarAtividades() async {
    return atividadeBox.values.toList();
  }
}
