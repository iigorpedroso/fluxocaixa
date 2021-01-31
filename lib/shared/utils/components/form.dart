

import 'package:flutter/material.dart';

class FormDataField extends StatelessWidget {
  String label;
  int line;
  IconData icon;
  TextEditingController controller;
  TextInputType textInputType;
  Function validator;
  String hintText;
  bool obscureText;

  FormDataField(
      {@required this.label,
        @required this.line,
        @required this.controller,
        @required this.textInputType,
        this.validator,
        this.icon,
        this.hintText,
        this.obscureText});

  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }

  Widget _buildForm() {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: line,
      obscureText: obscureText != null? obscureText : false,
      style: TextStyle(color: Colors.black),
      keyboardType: textInputType,
      decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black45)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black45)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black45)),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black45)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black45)),
          labelStyle: TextStyle(color: Colors.black45),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black45),
          labelText: label,
          icon: icon != null?  Icon(
            icon,
            color: Colors.black45,
            size: 25,
          ) : null,
          suffixStyle: TextStyle(color: Colors.black45)),
    );
  }
}
