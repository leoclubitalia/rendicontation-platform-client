import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InputField extends StatelessWidget {
  final String labelText;
  final bool multiline;
  final bool isPassword;
  final Function onChanged;
  final Function onSubmit;
  final Function onTap;
  final TextAlign textAlign;
  final TextEditingController controller;
  final TextInputType keyboardType;


  const InputField({Key key, this.labelText, this.controller, this.onChanged, this.onSubmit, this.onTap, this.keyboardType, this.multiline, this.textAlign, this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
        obscureText: isPassword,
        textAlign: this.textAlign == null ? TextAlign.left : this.textAlign,
        maxLines: multiline != null && multiline == true ? null : 1,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ] : null,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        onTap: onTap,
        controller: controller,
        cursorColor: Theme.of(context).hoverColor,
        style: TextStyle(height: 1.0),
        decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).unselectedWidgetColor,
            )
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).unselectedWidgetColor,
          ),
        )
      ),
    );
  }


}