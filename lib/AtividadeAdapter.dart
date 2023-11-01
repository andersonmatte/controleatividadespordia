import 'package:controleatividadespordia/Atividade.dart';
import 'package:hive/hive.dart';

class AtividadeAdapter extends TypeAdapter<Atividade> {
  @override
  int get typeId => 0;

  @override
  Atividade read(BinaryReader reader) {
    return Atividade(
      titulo: reader.read(),
      descricao: reader.read(),
      responsavel: reader.read(),
      status: reader.read(),
      link: reader.read(),
      dia: reader.read(),
      mes: reader.read(),
      ano: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Atividade obj) {
    writer.write(obj.titulo);
    writer.write(obj.descricao);
    writer.write(obj.responsavel);
    writer.write(obj.status);
    writer.write(obj.link);
    writer.write(obj.dia);
    writer.write(obj.mes);
    writer.write(obj.ano);
  }
}
