import 'package:flutter/material.dart';

typedef ConsumeString(String? value);    // Consumer function takes in
// String
// and returns void

class WritingSystemsDropdown extends StatelessWidget {
  // UI Constants
  final int elevation = 16;
  final double height = 2;

  // Attr
  final Map<String, String> writingSystems;

  // State
  String frontValue;
  String backValue;

  WritingSystemsDropdown({Key? key, required this.writingSystems}) :
    frontValue = writingSystems.keys.toList(growable: false).first,
    backValue = writingSystems.keys.toList(growable: false)[1],
    super(key: key);

  @override
  Widget build(BuildContext context) {
    frontValue = writingSystems.keys.toList(growable: false).first;
    backValue = writingSystems.keys.toList(growable: false)[1];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildDropdown(context, frontValue, backValue, (newValue) => {
          frontValue = newValue!  // use ! only if sure it will nvr be null
          // suppress warnings strikes again
        }),
        _buildDropdown(context, backValue, frontValue, (newValue) => {
          backValue = newValue!
        }),
      ],
    );
  }

  Widget _buildDropdown(BuildContext context, String selectedValue,
      String unselectableValue, ConsumeString onChange) {
    return DropdownButton<String>(
        value: writingSystems[selectedValue],
        icon: const Icon(Icons.arrow_downward),
        elevation: elevation,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(height: height, color: Colors.deepPurpleAccent),
        onChanged: onChange,
        items:
          writingSystems.values.toList()
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
              value: value,
              enabled: (value == writingSystems[unselectableValue]) ? false :
              true,
              child: Text(value),
              );
            }).toList(), // returns list of dropdown menu items
    );
  }

}
