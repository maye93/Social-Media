import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class ComposeScreen extends StatelessWidget {
  ComposeScreen({Key? key}) : super(key: key);

  final userTransferAmount = TextEditingController();
  final transferCardDetails = TextEditingController();
  final transferNote = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Form(
            key: _formkey,
            child: Stack(
              alignment: Alignment.center, 
              children: [
              ////////////////////// BACKGROUND //////////////////////
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),

              ////////////////////// CLOSE ICON ////////////////////
                Positioned(
                  top: 80,
                  left: 20,
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: const Color(0xFFF0722A),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.person),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      )
                    )
                  )
                ),

              ///////////////////////// LOGO /////////////////////////
                Positioned(
                  top: 55,
                  child: Material(
                    elevation: 1000,
                    color: Colors.transparent,
                    child: Container(
                      height: 100, width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.scaleDown,
                        )
                      )
                    )
                  )
                ),

              ////////////////////// PEN ICON ////////////////////
                Positioned(
                  top: 75,
                  right: 10,
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: IconButton(
                        iconSize: 45,
                        icon: const Icon(Icons.edit),
                        color: const Color(0xFFF0722A),
                        onPressed: () {
                          
                        },
                      )
                    )
                  )
                ),

              ////////////////////// PURPLE BOX ///////////////////////
                Positioned(
                  top: 150,
                  child: Container(
                    height: MediaQuery.of(context).size.height, 
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFF544C92),
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(30),
                      //   topLeft: Radius.circular(30),
                      // )
                    )
                  )
                ),

              ////////////////////// NOTE TEXTFIELD /////////////////////
              Positioned(
                top: 600,
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: TextFormField(
                    controller: transferNote,
                    textAlign: TextAlign.center,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(240)
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'What would you like to say?',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                        EdgeInsets.symmetric(vertical: 20),
                    ),
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
