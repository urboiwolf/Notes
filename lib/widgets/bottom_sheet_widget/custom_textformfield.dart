import 'package:flutter/material.dart';
import '../../const/const.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hint,
      this.maxLines = 1,
      this.onSave,
      this.onChanged,
      this.onTap,
      this.initialValue,
      this.textStyle});
  final String? hint;
  final String? initialValue;
  final TextStyle? textStyle;

  final int maxLines;
  final Function(String)? onChanged;
  final void Function(String?)? onSave;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: textStyle,
        onChanged: onChanged,
        onSaved: onSave,
        onTap: onTap,
        validator: (value) {
          // if(value?.isEmpty ?? true){
          //   return 'Field cannot be empty';
          // }
          if (value == null || value.isEmpty) {
            return 'Field cannot be empty';
          } else {
            return null;
          }
        },
        initialValue: initialValue,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kPrimaryColor),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // border: buildBorder(Colors.white),
          // enabledBorder: buildBorder(Colors.white),
          // focusedBorder: buildBorder(kPrimaryColor),
        ));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
