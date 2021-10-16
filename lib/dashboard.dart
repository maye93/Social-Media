import 'package:flutter/material.dart';
import 'posts/postsDesign.dart';
import 'posts/postsText.dart';
import 'compose.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final accountIcon =
    SnackBar(content: Text('ERROR: account page is still being fixed.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center, 
          children: [
          ////////////////////// BACKGROUND //////////////////////
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),

          ////////////////////// ACCOUNT ICON ////////////////////
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
                        ScaffoldMessenger.of(context)
                        .showSnackBar(accountIcon);
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
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => ComposeScreen()
                        )
                      );
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
          
          ////////////////////// PURPLE BOX ///////////////////////
            Positioned(
              top: 150,
              child:Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ListView.separated(
                  itemCount: Posts.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return PostBox(
                      post: Posts[index]
                    );
                  }
                )
              ),
            ),
          
          // ///////////////////////// POSTS ////////////////////////
          //   SingleChildScrollView(
          //     // reverse: true,
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //           top: 400, left: 5, right: 5),
          //       child: ListView.separated(
          //           itemCount: Posts.length,
          //           shrinkWrap: true,
          //           physics: NeverScrollableScrollPhysics(),
          //           separatorBuilder: (context, index) {
          //             return SizedBox(
          //               height: 10,
          //             );
          //           },
          //           itemBuilder: (context, index) {
          //             return PostBox(
          //                 post: Posts[index]);
          //           }
          //         )
          //       ),
          //     ),
          ]
        )
      )
    );
  }
}