import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledsdoit/constants/app_colors.dart';

class SearchField extends StatefulWidget {
  final FocusNode focusNode;
  final Function(String) onSearch;
  final TextEditingController controller;
  final VoidCallback callback;

  const SearchField({
    super.key,
    required this.focusNode,
    required this.onSearch,
    required this.controller,
    required this.callback,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: widget.focusNode.hasFocus
            ? AppColors.blueLight
            : AppColors.greyLayer,
        filled: true,
        prefixIcon: SvgPicture.asset(
          'assets/icons/search_icon.svg',
          fit: BoxFit.scaleDown,
        ),
        suffixIcon: widget.controller.text.isNotEmpty
            ? IconButton(
                icon: SvgPicture.asset('assets/icons/clear_icon.svg'),
                onPressed: () {
                  widget.callback();
                  widget.controller.clear();
                  widget.onSearch('');
                  widget.focusNode.unfocus();
                })
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(fontSize: 18),
      onSubmitted: widget.onSearch,
    );
  }
}
