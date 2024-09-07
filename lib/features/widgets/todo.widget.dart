import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/core.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({super.key, required this.todo});
  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: todo.isDone, onChanged: (clicked) {}),
        SizedBox(width: 10.w),
        Text(
          todo.title,
          style: const TextStyle(decoration: TextDecoration.overline),
        ),
      ],
    );
  }
}
