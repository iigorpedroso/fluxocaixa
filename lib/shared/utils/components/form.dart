import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FormDataField extends StatelessWidget {
  String label;
  int line;
  IconData icon;
  TextEditingController controller;
  TextInputType textInputType;
  Function validator;
  String hintText;
  bool obscureText;
  List<TextInputFormatter> textInputFormatters;


  FormDataField(
      {@required this.label,
      @required this.line,
      @required this.controller,
      @required this.textInputType,
      this.validator,
      this.icon,
      this.textInputFormatters,
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
      inputFormatters: textInputFormatters,
      obscureText: obscureText != null ? obscureText : false,
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
          icon: icon != null
              ? Icon(
                  icon,
                  color: Colors.black45,
                  size: 25,
                )
              : null,
          suffixStyle: TextStyle(color: Colors.black45)),
    );
  }
}

class DropDownButton extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  List items;

  DropDownButton({
    @required this.controller,
    @required this.hintText,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }

  Widget _buildForm() {
    return DropdownButtonFormField(
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
          hintStyle: TextStyle(color: Colors.black45),
          suffixStyle: TextStyle(color: Colors.black45)),
      icon: Icon(Icons.keyboard_arrow_down_sharp),
      hint: Text(hintText),
      onChanged: (value) {
        if (value.isEmpty) return "Campo Obrigatório!";
        controller.text = value;
      },
      items: [
        for (var item in items)
          DropdownMenuItem(value: item.id.toString(), child: Text(item.name))
      ],
    );
  }
}

class FormHours extends StatefulWidget {
  String label;
  String suffix;
  IconData icon;
  TextEditingController controller;
  Function validator;
  String hintText;

  FormHours(
      {@required this.label,
      @required this.suffix,
      @required this.controller,
      this.validator,
      this.icon,
      this.hintText});

  @override
  _FormHoursState createState() => _FormHoursState();
}

class _FormHoursState extends State<FormHours> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        TimeOfDay date = await showTimePicker(
            context: context,
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData.light(),
                child: child,
              );
            },
            initialTime: TimeOfDay.now());
        if (date != null) {
          widget.controller.text =
              date.hour.toString() + ":" + date.minute.toString();
        }
      },
      controller: widget.controller,
      validator: widget.validator,
      style: TextStyle(color: Colors.black),
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
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black45),
          labelText: widget.label,
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: Colors.black45,
                  size: 25,
                )
              : null,
          suffixStyle: TextStyle(color: Colors.black45)),
    );
  }
}

class FormDate extends StatefulWidget {
  String label;
  String suffix;
  IconData icon;
  TextEditingController controller;
  Function validator;
  String hintText;

  FormDate(
      {@required this.label,
      @required this.suffix,
      @required this.controller,
      this.validator,
      this.icon,
      this.hintText});

  @override
  _FormDateState createState() => _FormDateState();
}

class _FormDateState extends State<FormDate> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    var initialDate = DateTime.now();

    return TextFormField(
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        DateTime date = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1950),
            lastDate: DateTime.now(),
            builder: (BuildContext context, Widget child) {
              return Theme(
                data: ThemeData.light(),
                child: child,
              );
            });
        if (date != null) {
          String day =
              date.day < 10 ? "0" + date.day.toString() : date.day.toString();
          String month = date.month < 10
              ? "0" + date.month.toString()
              : date.month.toString();
          String year = date.year.toString();
          widget.controller.text = day + "/" + month + "/" + year;
        }
      },
      controller: widget.controller,
      validator: widget.validator,
      style: TextStyle(color: Colors.black),
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
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black45),
          labelText: widget.label,
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: Colors.black45,
                  size: 25,
                )
              : null,
          suffixStyle: TextStyle(color: Colors.black45)),
    );
  }
}
