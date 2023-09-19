import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function(String? val) validator;
  const PhoneNumberField(
      {Key? key,
      required this.icon,
      required this.label,
      this.keyboardType,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value!),
      controller: controller,
      style: TextStyle(color: Color(0xFF000000)),
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        fillColor: Color(0xfff4f5f9),
        filled: true,
        prefixIcon: Icon(icon),
        labelText: label,
        hintText: 'Enter phone number Here',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
