
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../app_colors.dart';

class textinputfield extends StatelessWidget {
  const textinputfield({
    Key? key,
    this.icon,
    this.text,
    this.maxlength,
    this.suffixicon,
    this.suffixiconcolor,
    this.validator,
    this.controllers,
    this.isObscure = false,
    this.textcolor,
    this.keyboardtype,
    this.onchanged,
    this.labeltext,
  }) : super(key: key);
  final icon;
  final text;
  final labeltext;
  final maxlength;
  final suffixicon;
  final suffixiconcolor;
  final validator;
  final controllers;
  final isObscure;
  final textcolor;
  final keyboardtype;
  final onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxlength,
      validator: validator,
      controller: controllers,
      onChanged: onchanged,
      obscureText: isObscure,
      style: TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.whiteColor, width: 2.0),
          ),
          errorStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.only(top: 10),
          hintText: text,
          labelText: labeltext,
          labelStyle: TextStyle(
              color: HexColor("#FFFFFF"), fontFamily: 'Libre', fontSize: 16),
          // errorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.white),
          //   borderRadius: BorderRadius.circular(12),
          // ),
          suffixIcon: Icon(suffixicon, color: suffixiconcolor),
          hintStyle: TextStyle(
            color: HexColor("#FFFFFF"),
            fontFamily: 'Libre',
          ),
          filled: true,
          fillColor: AppColors.textFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIconColor: Colors.white,
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Colors.white,
              ))),
    );
  }
}
