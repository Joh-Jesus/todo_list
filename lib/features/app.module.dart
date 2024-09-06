import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/features/home/home.dart';
import 'package:todo_list/utils/utils.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(initRoute, module: HomeModule());
  }

  @override
  void binds(i) {
    i.addLazySingleton<SharedPreferences>(() async => await SharedPreferences.getInstance());
  }
}
