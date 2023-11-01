import 'package:controleatividadespordia/Atividade.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Atividade> getTask() => Hive.box<Atividade>("atividade");
}
