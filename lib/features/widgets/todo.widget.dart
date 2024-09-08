import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/core.dart';
import 'package:todo_list/features/home/home.dart';

class TodoWidget extends StatelessWidget {
  TodoWidget({super.key, required this.todo});
  final TodoModel todo;
  final HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    bool check = todo.done;
    return Observer(builder: (context) {
      return Row(
        children: [
          store.checkingLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Checkbox(
                  value: check,
                  onChanged: (_) async {
                    check = !check;
                    await store.checkTodo(todo.id, check);
                  },
                ),
          SizedBox(width: 8.w),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                check = !check;
                await store.checkTodo(todo.id, check);
              },
              child: Text(
                todo.title,
                style: TextStyle(decoration: todo.done ? TextDecoration.lineThrough : null),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            onPressed: () async {
              await store.removeTodo(todo.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      );
    });
  }
}
