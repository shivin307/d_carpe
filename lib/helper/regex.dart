import 'package:flutter/services.dart';

var inputTextEmailFormatter = FilteringTextInputFormatter.allow(
  RegExp(r'[a-zA-Z0-9._%+-@]'),
);


class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any characters that are not digits or '+'
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9+]'), '');

    // Ensure '+' sign appears only at the beginning
    if (newText.startsWith('+')) {
      // Keep the '+' at the beginning and remove any additional '+' signs
      newText = '+${newText.substring(1).replaceAll('+', '')}';
    } else {
      // If '+' is not at the beginning, remove all '+'
      newText = newText.replaceAll('+', '');
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
