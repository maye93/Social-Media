import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'account.dart';
import 'dashboard.dart';

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
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center, 
            children: [

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
                          BlendMode.dstATop
                        ),
                      )
                    )
                  )
                )
              ),

              Positioned(
                top: 150,
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
                      )
                    )
                  )
                )
              ),

          
              Positioned(
                top: 330,
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: username,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    )
                  )
                )
              ),

              Positioned(
                top: 380,
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    )
                  )
                )
              ),

              Positioned(
                top: 450,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (username.text == Account().account() &&
                          password.text == Account().password()) {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => DashboardScreen()
                          )
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(loginError);
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        )
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFEE712B))
                    )
                  )
                )
              ),

              Positioned(
                top: 510,
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(signupError);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))
                        ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF544C93))
                    )
                  )
                )
              ),
            ]
          )
        )
      )
    );
  }
}
