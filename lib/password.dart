import 'package:flutter/material.dart';


class contraField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  contraField({required this.controller, required this.labelText});

  @override
  contraFieldState createState() => contraFieldState();
}

class contraFieldState extends State<contraField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLength: 11,
      keyboardType: TextInputType.text,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}