import 'package:controleatividadespordia/Atividade.dart';
import 'package:controleatividadespordia/HiveService.dart';
import 'package:controleatividadespordia/main.dart';
import 'package:flutter/material.dart';

class AtualizarCadastroAtividade extends StatefulWidget {
  final Atividade atividade;

  const AtualizarCadastroAtividade(
      {Key? key,
      required this.atividade})
      : super(key: key);

  @override
  State<AtualizarCadastroAtividade> createState() => _AtualizarCadastroAtividadeState();
}

class _AtualizarCadastroAtividadeState extends State<AtualizarCadastroAtividade> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _responsavelController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tituloController.text = widget.atividade.titulo;
    _descricaoController.text = widget.atividade.descricao;
    _linkController.text = widget.atividade.link!;
    _responsavelController.text = widget.atividade.responsavel;
    _statusController.text = widget.atividade.status;
  }

  @override
  Widget build(BuildContext context) {
    int dia = widget.atividade.dia;
    int mes = widget.atividade.mes;
    int ano = widget.atividade.ano;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.withOpacity(0.7),
        title: Text(
          'Detalhes do Dia $dia de $mes de $ano',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 12.0),
                Row(children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Título é obrigatório!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      controller: _tituloController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        labelText: 'Título*',
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: 'Informe o título da atividade',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _linkController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        labelText: 'Link',
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: 'Informe o link da atividade',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ]),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Responsável é obrigatório!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: _responsavelController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          labelText: 'Responsável*',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Informe o responsável da atividade',
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Status é obrigatório!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: _statusController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          labelText: 'Status*',
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Informe o status da atividade',
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink.withOpacity(0.7)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Descrição é obrigatório!';
                    }
                    return null;
                  },
                  maxLines: 15,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  controller: _descricaoController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    labelText: 'Descrição*',
                    labelStyle: const TextStyle(color: Colors.black),
                    hintText: 'Informe a descrição da atividade',
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.pink.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.pink.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 6.0),
                const Text(
                  '*Campos obrigatórios',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16.0),
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
                        if (_formKey.currentState!.validate()) {
                          atualizarAtividade();
                          limparCampos();
                          showToast(context, "Registro atualizado com sucesso!");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              MyApp()
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Atualizar Atividade".toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void atualizarAtividade() {
    HiveService.atualizarAtividade(widget.atividade, _tituloController.text, _descricaoController.text, _linkController.text, _responsavelController.text, _statusController.text);
  }

  void limparCampos() {
    _tituloController.clear();
    _descricaoController.clear();
    _linkController.clear();
    _responsavelController.clear();
    _statusController.clear();
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

}

void showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'Roboto',
        ),
      ),
      backgroundColor: Colors.pink.withOpacity(0.7),
    ),
  );
}
