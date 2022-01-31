import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '/models/registerRequest.dart';
import '/services/apiService.dart';

import '../config.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff39065a),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height / 3,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Color(0xff39065a),
            //       Colors.white54,
            //       Color(0xff39065a),
            //       // Color(0xfff5550e),
            //     ],
            //   ),
            //   borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(70),
            //     bottomRight: Radius.circular(70),
            //   ),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/3.png",
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 10,
              top: 25,
            ),
            child: Text(
              "Register",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            Icon(Icons.person),
            "Username",
            'Username',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Username can\'t be empty";
              }
              return null;
            },
            (onSavedVal) {
              username = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 18,
          ),
          SizedBox(height: 10),
          FormHelper.inputFieldWidget(
            context,
            Icon(Icons.person),
            "password",
            'password',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "password can\'t be empty";
              }
              return null;
            },
            (onSavedVal) {
              email = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 18,
            obscureText: hidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.white.withOpacity(0.7),
              icon: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 10),
          FormHelper.inputFieldWidget(
            context,
            Icon(Icons.person),
            "Email",
            'Email',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Email can\'t be empty";
              }
              return null;
            },
            (onSavedVal) {
              username = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 18,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Register",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(
                    username: username!,
                    password: password!,
                    email: email!,
                  );
                  APIService.register(model).then((response) {
                    setState(() {
                      isAPIcallProcess = false;
                    });
                    if (response.data != null) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        response.message,
                        "Ok",
                        () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        },
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        "Invalid Username/Password !",
                        "Ok",
                        () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  });
                }
              },
              btnColor: Color(0xff39065a),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Color(0xfff5550e),
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: "I already have an account",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/");
                          },
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
