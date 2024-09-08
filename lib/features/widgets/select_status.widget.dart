import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/core.dart';
import 'package:todo_list/features/features.dart';

class SelectStatusWidget extends StatelessWidget {
  SelectStatusWidget({super.key, required this.status, required this.title});
  final HomeFilterStatus status;
  final String title;
  final HomeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () => store.updateStatus(status),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      store.filterStatus == status ? Colors.blue.shade900 : Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.r),
              color: store.filterStatus == status ? Colors.blue.shade900 : Colors.grey.shade300,
            ),
            width: 100.w,
            height: 25.h,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: store.filterStatus == status ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      },
    );
  }
}
