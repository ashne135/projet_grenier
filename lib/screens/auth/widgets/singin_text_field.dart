import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../style/palette.dart';
import '../login.dart';

class SinginTextField extends StatefulWidget {
  const SinginTextField({
    super.key,
    required this.firstNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController confirmPasswordController;
  @override
  State<SinginTextField> createState() => _SinginTextFieldState();
}

class _SinginTextFieldState extends State<SinginTextField> {
  //////////// password visibility ///////////////////
  bool isVisiblePassword = false;
  bool isVisiblePassword1 = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    //////////////////////first name field ///////////
    final firstNameFiel = TextFormField(
      cursorColor: Palette.appPrimaryColor,

      autofocus: false,

      //first name validator
      validator: (value) {
        if (value!.isEmpty) {
          return ('Le nom est obligatoire !');
        }

        if (value.length < 2) {
          return ('Nom trop court !');
        }

        return null;
      },
      controller: widget.firstNameController,
      keyboardType: TextInputType.name,
      //validation: ()=>{}
      onSaved: (value) {
        widget.firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.person,
          color: Palette.secondaryColor,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: 'Nom complet',
        labelStyle: const TextStyle(color: Palette.secondaryColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),

        //fillColor: Style.appWhite,
      ),
    );

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
        widget.emailController.text = value!;
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
      onTap: () {
        setState(() {
          isVisible = true;
        });
      },
      cursorColor: Palette.appPrimaryColor,
      controller: widget.passwordController,
      autofocus: false,
      obscureText: !isVisiblePassword ? true : false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Veuillez renseigner le mot de passe !");
        }

        if (!RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value.toString())) {
          return ('Vuillez correctement rensegner ce champ');
        }

        //email match regEx

        return null;
      },
      onSaved: (value) {
        widget.passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
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
        prefixIcon: const Icon(
          CupertinoIcons.lock,
          color: Palette.secondaryColor,
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

    ///////////////confirm password field/////////////
    final confirmPasswordField = TextFormField(
      cursorColor: Palette.appPrimaryColor,
      controller: widget.confirmPasswordController,
      autofocus: false,
      obscureText: !isVisiblePassword1 ? true : false,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Veuillez confirmer le mot de passe !");
        }
        if (widget.confirmPasswordController.text !=
            widget.passwordController.text) {
          return ("Les mots de passe ne correspondent pas !");
        }
        //email match regEx

        return null;
      },
      onSaved: (value) {
        widget.confirmPasswordController.text = value!;
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
              if (isVisiblePassword1) {
                isVisiblePassword1 = false;
              } else {
                isVisiblePassword1 = true;
              }
            });
          },
          child: !isVisiblePassword1
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
        labelText: 'Répéter le mot de passe',
        labelStyle: const TextStyle(color: Palette.secondaryColor),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );

    /* final pwdValidator = FlutterPwValidator(
      controller: widget.passwordController,
      minLength: 8,
      uppercaseCharCount: 1,
      numericCharCount: 1,
      specialCharCount: 1,
      width: 400,
      height: 150,
      onSuccess: () {
        setState(() {
          isVisible = false;
        });
      },
      onFail: () {
        setState(() {
          isVisible = true;
        });
      },
      strings: FrenchStrings(),
    ); */

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
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: firstNameFiel,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
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
        isVisible
            ? Container(
                width: double.infinity,
                height: 90,
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 25,
                  left: 25,
                ),
                // color: Colors.amber,
                //child: pwdValidator,
                child: Container(),
              )
            : Container(),
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
            child: confirmPasswordField,
          ),
        ), */
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                  //fullscreenDialog: true,
                ),
              );
            },
            child: const Text(
              'J\'ai déjà un compte',
              style: TextStyle(
                color: Palette.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
