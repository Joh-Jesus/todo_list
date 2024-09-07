import 'package:flutter/material.dart';

class FilterIconWidget extends StatelessWidget {
  const FilterIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}
