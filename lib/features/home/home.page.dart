import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/core.dart';
import 'package:todo_list/features/features.dart';
import 'package:todo_list/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.getTodos();
  }

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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed("$appRoute$createTodo");
        },
        backgroundColor: Colors.blue.shade900,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              children: [
                store.loading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectStatusWidget(status: HomeFilterStatus.all, title: "Todas"),
                                SizedBox(width: 10.w),
                                SelectStatusWidget(
                                    status: HomeFilterStatus.done, title: "Concluídas"),
                                SizedBox(width: 10.w),
                                SelectStatusWidget(
                                    status: HomeFilterStatus.undone, title: "Pendentes"),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Visibility(
                            visible: store.filteredTodos.isNotEmpty,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: store.filteredTodos.length,
                              itemBuilder: (BuildContext context, int index) {
                                final todo = store.filteredTodos[index];
                                return TodoWidget(todo: todo);
                              },
                            ),
                          ),
                          Visibility(
                            visible: store.filteredTodos.isEmpty,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "Nenhuma tarefa encontrada",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Visibility(
                                    visible: store.filterStatus == HomeFilterStatus.all,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade900,
                                      ),
                                      onPressed: () {
                                        Modular.to.pushNamed("$appRoute$createTodo");
                                      },
                                      child: const Text(
                                        "Adicionar tarefa",
                                        style: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
