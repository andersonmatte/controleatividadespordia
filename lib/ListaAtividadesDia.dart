import 'package:controleatividadespordia/HiveService.dart';
import 'package:flutter/material.dart';

import 'Atividade.dart';
import 'AtualizarCadastroAtividade.dart';

class ListaAtividadesDia extends StatelessWidget {
  final List<Atividade> atividades;

  ListaAtividadesDia(
    this.atividades,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.7),
        title: const Text('Lista de Atividades',
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: atividades.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildExpandableTile(atividades[index], context);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black54,
                height: 0.5,
                thickness: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildExpandableTile(Atividade item, BuildContext context) {
  return ExpansionTile(
    iconColor: Colors.pink.withOpacity(0.7),
    title: Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText("${item.responsavel} - ${item.titulo}",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.pink.withOpacity(0.7),
            ),
          ),
        ],
      ),
    ),
    children: <Widget>[
      ListTile(
        tileColor: const Color(0xFFcadefc),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              'Descrição:',
              style: TextStyle(
                color: Colors.pink.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SelectableText(
              item.descricao,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Link:',
              style: TextStyle(
                color: Colors.pink.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SelectableText(
              item.link!,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Status:',
              style: TextStyle(
                color: Colors.pink.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SelectableText(
              item.status,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Responsável:',
              style: TextStyle(
                color: Colors.pink.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SelectableText(
              item.responsavel,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AtualizarCadastroAtividade(
                              atividade: item,
                            )));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Editar Atividade ',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Excluir Atividade',
                          style: TextStyle(
                            color: Colors.pink.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          )),
                      content: const Text(
                          'Tem certeza que deseja excluir a atividade selecionada?',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          )),
                      actions: [
                        Center(
                          child: Container(
                            height: 45,
                            width: 250,
                            margin: const EdgeInsets.only(top: 30.0),
                            decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                HiveService.deleteAtividade(item);
                                showToast(
                                    context, "Atividade excluída com sucesso!");
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Sim".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 45,
                            width: 250,
                            margin: const EdgeInsets.only(top: 30.0),
                            decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Não".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    );
                  },
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Excluir Atividade ',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
