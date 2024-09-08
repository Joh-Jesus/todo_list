import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/features/features.dart';
import 'package:todo_list/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Modular.setInitialRoute("$appRoute$homeRoute");
  runApp(
    ScreenUtilInit(
      designSize: const Size(392, 783),
      builder: (context, child) {
        return ModularApp(module: AppModule(), child: const TodoList());
      },
      minTextAdapt: true,
      splitScreenMode: true,
    ),
  );
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'To do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
