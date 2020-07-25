import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ValueChanged<T> = void Function(T value);
typedef FormFieldValidator<T> = String Function(T value);
typedef FormFieldSetter<T> = void Function(T newValue);

class TextFormFieldPadrao extends StatelessWidget {
  final FocusNode focusNode;
  final String labelText;
  final bool obscureText;
  final String initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization textCapitalization;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onFieldSubmitted;
  final bool autoCorrect;
  final Icon prefixIcon;
  final IconButton sufixIcon;
  final int minLines;
  final int maxLines;
  final int maxLength;

  TextFormFieldPadrao({
    Key key,
    this.focusNode,
    this.labelText,
    this.obscureText = false,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.autoCorrect = true,
    this.prefixIcon,
    this.sufixIcon,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: (inputFormatters == null) ? null : inputFormatters,
      textCapitalization: textCapitalization,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      autocorrect: autoCorrect,
      keyboardAppearance: MediaQuery.of(context).platformBrightness,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
    );
  }
}