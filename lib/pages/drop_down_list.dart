import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String? hint;
  final bool isSelected;
  final List<SelectedListItem>? data_list;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    this.hint,
    required this.isSelected,
    this.data_list,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        maxSelectedItems: 3,
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.data_list ?? [],
        onSelected: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
              widget.textEditingController.text = item.name;
            }
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isSelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.textEditingController.text == ""
                ? widget.hint
                : widget.textEditingController.text,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}