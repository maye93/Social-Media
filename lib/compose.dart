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
                  top: 70,
                  left: 10,
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.close),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    )
                  )
                ),

              ////////////////////// SEND ICON ////////////////////
                Positioned(
                  top: 70,
                  right: 10,
                  child: Material(
                    color: Colors.transparent,
                    child: Center(
                      child: IconButton(
                        iconSize: 50,
                        icon: const Icon(Icons.send),
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
                    )
                  )
                ),

              ////////////////////// NOTE TEXTFIELD /////////////////////
              Positioned(
                top: 180,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width-40,
                    child: TextFormField(
                      controller: transferNote,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      maxLines: 9,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(240)
                      ],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What would you like to say?',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.transparent,
                        filled: true,
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
