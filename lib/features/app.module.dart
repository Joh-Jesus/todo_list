import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/features/home/home.dart';
import 'package:todo_list/utils/utils.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(appRoute, module: HomeModule());
  }
}
