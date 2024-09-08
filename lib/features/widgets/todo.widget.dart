import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/core.dart';
import 'package:todo_list/features/home/home.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key, required this.todo});
  final TodoModel todo;

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  final HomeStore store = Modular.get();

  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    bool check = widget.todo.done;
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Observer(builder: (context) {
        return AnimatedContainer(
          decoration:
              BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8.r)),
          duration: 300.ms,
          height: store.checkingLoading ? 30.h : 45.h,
          child: Row(
            children: [
              Checkbox(
                value: check,
                onChanged: (_) async {
                  check = !check;
                  await store.checkTodo(widget.todo.id, check);
                },
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    check = !check;

                    await store.checkTodo(widget.todo.id, check);
                  },
                  child: Text(
                    widget.todo.title,
                    style:
                        TextStyle(decoration: widget.todo.done ? TextDecoration.lineThrough : null),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              AnimatedCrossFade(
                firstChild: IconButton(
                  onPressed: () async {
                    if (deleted) return;
                    setState(() {
                      deleted = true;
                    });
                    await Future.delayed(const Duration(milliseconds: 300));

                    setState(() {
                      deleted = false;
                    });
                    await store.removeTodo(widget.todo.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 25.r,
                    color: Colors.red,
                  ),
                ),
                secondChild: Icon(
                  Icons.delete,
                  size: 35.r,
                  color: Colors.red,
                ),
                crossFadeState: deleted ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: 200.ms,
                firstCurve: Curves.bounceIn,
                secondCurve: Curves.bounceOut,
              )
            ],
          ),
        );
      }),
    );
  }
}
