import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class InputAutocomplete extends StatelessWidget {
  final String labelText;
  final bool typeable;
  final Function onSuggestion;
  final Function onSelect;
  final TextEditingController controller;


  const InputAutocomplete({Key key, this.labelText, this.controller, this.onSuggestion, this.onSelect, this.typeable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          inputFormatters: [
            typeable ? FilteringTextInputFormatter.allow(RegExp(r'.')) : FilteringTextInputFormatter.allow(RegExp(r'^$')),
          ],
          cursorColor: Theme.of(context).splashColor,
          autofocus: false,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Theme.of(context).unselectedWidgetColor,
                )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Theme.of(context).unselectedWidgetColor,
              ),
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: Theme.of(context).unselectedWidgetColor,
            ),
          ),
        ),
        suggestionsCallback: onSuggestion,
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion.toString()),
          );
        },
        onSuggestionSelected: onSelect,
      ),
    );
  }


}