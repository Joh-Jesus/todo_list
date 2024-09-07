import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/features/features.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Lista de tarefas",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.blue.shade900,
        actions: const [FilterIconWidget()],
      ),
      body: Observer(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              children: [
                store.loading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: ElevatedButton(
                              child: const Text("Criar nova tarefa"),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
