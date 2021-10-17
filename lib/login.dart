import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'account.dart';
import 'dashboard.dart';
// import 'package:practice/base_screen.dart';

class Account extends AdminAccount {
  account() {
    return super.account();
  }

  password() {
    return super.password();
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final username = TextEditingController();
  final password = TextEditingController();
  final loginError =
    SnackBar(content: Text('ERROR: invalid username or password.'));
  final signupError =
    SnackBar(content: Text('ERROR: sign up page is still being fixed.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: SingleChildScrollView(
                reverse: true,
                child: Stack(alignment: Alignment.center, children: [
                  ////////////////////// BACKGROUND //////////////////////
                  Positioned(
                      child: Material(
                          child: Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/background.jpg'),
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.dstATop),
                              ))))),

                  ///////////////////////// LOGO //////////////////////////
                  Positioned(
                      top: 200,
                      child: Material(
                          elevation: 1000,
                          color: Colors.transparent,
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/logo.png'),
                                fit: BoxFit.scaleDown,
                              ))))),

                  ///////////////////////// USERNAME ///////////////////////
                  Positioned(
                      top: 400,
                      child: SizedBox(
                          height: 100,
                          width: 300,
                          child: TextFormField(
                              controller: username,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(40)),
                                  hintText: 'Username',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Glacial',
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  // prefixIcon: Icon(Icons.person,
                                  //     color: Colors.grey)
                                  )))),

                  ///////////////////////// PASSWORD ///////////////////////
                  Positioned(
                      top: 450,
                      child: SizedBox(
                          height: 100,
                          width: 300,
                          child: TextFormField(
                              controller: password,
                              obscureText: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  // border: OutlineInputBorder(
                                  //     borderRadius: BorderRadius.circular(40)),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Glacial',
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  // prefixIcon: Icon(Icons.security,
                                  //     color: Colors.grey)
                                    )))),

                  ///////////////////////// LOGIN BUTTON //////////////////////
                  Positioned(
                      top: 550,
                      child: SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                              child: Text('Login',
                                  style: TextStyle(
                                    fontFamily: 'Glacial',
                                  )),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (username.text == Account().account() &&
                                    password.text == Account().password()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DashboardScreen()));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(loginError);
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15)),
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFEE712B)))))),

                  ///////////////////////// SIGN UP BUTTON //////////////////////
                  Positioned(
                      top: 620,
                      child: SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                              child: Text('Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Glacial',
                                  )),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                  .showSnackBar(signupError);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15)),
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF544C93)))))),
                ]))));
  }
}
