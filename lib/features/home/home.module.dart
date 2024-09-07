import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_list/core/core.dart';
import 'package:todo_list/features/features.dart';
import 'package:todo_list/utils/utils.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ILocalStorage>(LocalStorage.new);
    i.addLazySingleton<IHomeRepository>(HomeRepository.new);
    i.addLazySingleton<HomeStore>(HomeStore.new);
  }

  @override
  void routes(r) {
    r.child(homeRoute, child: (context) => HomePage());
  }
}
