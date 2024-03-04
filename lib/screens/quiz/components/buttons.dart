import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../quiz_screen.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const PrimaryButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: WhiteColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const SecondaryButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: SecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: PrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String text;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final bool suffixIconShow;
  final bool isPassword;

  const PasswordTextField({
    Key? key,
    required this.text,
    this.suffixIcon,
    required this.isPassword,
    required this.suffixIconShow,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _isObscure : false,
      style: TextStyle(color: BackgroundColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        filled: true,
        fillColor: WhiteColor,
        //prefixIcon é do lado esquerdo
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: widget.prefixIcon,
        ),
        //suffixIcon é do lado direito
        suffixIcon: widget.suffixIconShow
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child:
                      _isObscure ? widget.suffixIcon : Icon(Icons.visibility),
                ),
              )
            : null, // Se suffixIconShow for false, não mostra o ícone de sufixo
        hintText: widget.text,
        hintStyle: TextStyle(color: GrayColor),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
