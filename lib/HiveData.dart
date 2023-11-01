import 'package:hive/hive.dart';

import 'Atividade.dart';
import 'AtividadeAdapter.dart';

class HiveData {
  static init() async {
    Hive.init('C:/Users/Public/atividade.hive');
    Hive.registerAdapter(AtividadeAdapter());
    await Hive.openBox<Atividade>("atividade");
  }
}
