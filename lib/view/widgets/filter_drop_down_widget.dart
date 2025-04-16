import 'package:flutter/material.dart';

class FilterDropDownWidget extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;

  const FilterDropDownWidget({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      hint: Text(hint),
      underline: const SizedBox(),
      onChanged: onChanged,
      isDense: true,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      items: [
        DropdownMenuItem<String>(
          value: '',
          child: Text("All $hint"),
        ),
        ...items
            .where((item) => item != 'All')
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
      ],
      style: const TextStyle(fontSize: 13, color: Colors.black),
      borderRadius: BorderRadius.circular(12),
      dropdownColor: Colors.white,
    );
  }
}