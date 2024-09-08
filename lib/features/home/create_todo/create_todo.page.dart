import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/features/home/home.dart';

class CreateTodoPage extends StatelessWidget {
  CreateTodoPage({super.key});

  final HomeStore store = Modular.get();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Todo"),
      ),
      body: Observer(builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: store.loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            SizedBox(height: 24.h),
                            TextFormField(
                              controller: _controllerName,
                              decoration: const InputDecoration(
                                label: Text("Nome da tarefa"),
                                hintText: "Digite o nome da tarefa",
                                border: OutlineInputBorder(),
                              ),
                              validator: store.validatorInput,
                            ),
                            SizedBox(height: 24.h),
                            TextFormField(
                              controller: _controllerDescription,
                              decoration: const InputDecoration(
                                label: Text("Descrição da tarefa"),
                                hintText: "Digite a descrição da tarefa",
                                border: OutlineInputBorder(),
                              ),
                              validator: store.validatorInput,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () async {
                        final valid = _formKey.currentState?.validate() ?? false;
                        if (!valid) return;
                        await store.createTodo(
                          title: _controllerName.text,
                          description: _controllerDescription.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
        );
      }),
    );
  }
}
