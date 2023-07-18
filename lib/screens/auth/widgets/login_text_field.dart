import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../style/palette.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;

  final TextEditingController passwordController;
  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  /////////////////////// controllers/////////////////////////////////

  ////////////////checker//////////////////
  bool _isChecked = false;

  //////////// password visibility ///////////////////
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    ///////////// email field ///////////////////
    final emailField = TextFormField(
      cursorColor: Palette.appPrimaryColor,
      controller: widget.emailController,
      autofocus: false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Veuillez entrer un email correct !");
        }

        //email match regEx
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Veuillez entrer un email correct !");
        }

        return null;
      },
      onSaved: (value) {
        widget.passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.mail,
          color: Palette.secondaryColor,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: 'email',
        labelText: 'Email',
        labelStyle: const TextStyle(color: Palette.secondaryColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    //////////////////// password field ///////////////
    final passwordField = TextFormField(
      cursorColor: Palette.appPrimaryColor,
      controller: widget.passwordController,
      autofocus: false,
      obscureText: !isVisiblePassword ? true : false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Veuillez renseigner le mot de passe !");
        }

        //email match regEx

        return null;
      },
      onSaved: (value) {
        widget.passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.lock,
          color: Palette.secondaryColor,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              if (isVisiblePassword) {
                isVisiblePassword = false;
              } else {
                isVisiblePassword = true;
              }
            });
          },
          child: !isVisiblePassword
              ? const Icon(
                  CupertinoIcons.eye_slash,
                  color: Palette.secondaryColor,
                )
              : const Icon(
                  CupertinoIcons.eye,
                  color: Palette.secondaryColor,
                ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: 'email',
        labelText: 'Mot de passe',
        labelStyle: const TextStyle(color: Palette.secondaryColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    final checker = Checkbox(
      value: _isChecked,
      onChanged: (bool? newValue) {
        setState(() {
          _isChecked = newValue!;
        });
      },
      activeColor: Palette.appPrimaryColor, // color when checkbox is checked
      checkColor: Colors.white, // color of checkmark when checkbox is checked
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
            left: 15.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
                color: Palette.appPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50.0)),
            child: emailField,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        /* Padding(
          padding: const EdgeInsets.only(
            right: 15.0,
            left: 15.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: Palette.appPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: passwordField,
          ),
        ), */
        Container(
          padding: const EdgeInsets.only(
            right: 25.0,
            left: 15.0,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  checker,
                  const Text(
                    'Se souvenir de moi',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              /* InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ResetEmailScreen();
                  }));
                },
                child: const Text(' Mot de passe oublié ?'),
              ) */
              Container(),
            ],
          ),
        ),
      ],
    );
  }
}
