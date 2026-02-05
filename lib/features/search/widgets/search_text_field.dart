import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      style: textStyle,
      cursorHeight: textStyle?.fontSize,
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        hintText: 'Enter city name',
        hintStyle: textStyle,
        prefixIcon: Icon(
          Icons.search,
          size: 25,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
      onFieldSubmitted: (_) => onSubmitted(),
    );
  }
}
