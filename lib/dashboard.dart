import 'package:flutter/material.dart';
import 'account.dart';
import 'compose.dart';

class Account extends AdminAccount {
  account() {
    return super.account();
  }

  image() {
    return super.image();
  }
}

class NewPost extends Compose {
  message() {
    return super.message();
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardScreen(),
  ));
}

class DashboardScreen extends StatefulWidget {
  @override
  Dashboard createState() => Dashboard();
}

class Dashboard extends State<DashboardScreen> {
  String accountName = Account().account();
  final accountIcon = SnackBar(content: Text('ERROR: account page is still being fixed.'));
  final settingsIcon = SnackBar(content: Text('ERROR: settings page is still being fixed.'));
  final postUpdate = SnackBar(content: Text('UPDATE: post has been successfully published.'));

  final List<PostTiles> postsList = <PostTiles>[
    PostTiles("assets/dwight.jpeg", "Dwight", "When someone smiles at me, all I see is a chimpanzee begging for its life."),
    PostTiles("assets/pam.jpeg", "Pam", "HAHAHAHHAHAHAHAH"),
    PostTiles("assets/stanley.jpeg", "Stanley", "BOY HAVE YOU LOST YOUR MIND?!"),
    PostTiles("assets/meredith.jpeg", "Meredith", "*drinks alcohol*"),
    PostTiles("assets/kevin.jpeg", "Kevin", "why waste time say lot word"),
    PostTiles("assets/pig.jpg", "Pig", "hmmm"),
    PostTiles("assets/darth.jpg", "Darth Dwight", "JOIN THE SITH"),
    PostTiles("assets/jim.jpg", "Jim", "Identity theft is not a joke, Jim! Millions of families suffer every year!"),
    PostTiles("assets/joker.jpg", "Joker", "Why so serious?"),
    PostTiles("assets/serial.jpg", "Serial Killer", "............"),
    PostTiles("assets/pumpkin.jpg", "PumpkinHead","The pumpkin should rot off my head in a month or two, right?"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Image.asset(Account().image()),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(accountIcon);
            },
          ),
          title: Container(
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.scaleDown,
              ))),
          actions: [
            IconButton(
              iconSize: 35,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(settingsIcon);
              },
            )
          ],
        ),
        body: RefreshIndicator(
          edgeOffset: 0,
          onRefresh: _refresh,
          child: ListView.builder(
            itemCount: postsList.length,
            itemBuilder: (ListViewContext, index) {
              return Container(
                margin: EdgeInsets.all(1),
                color: Color(0xFF514A90),
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(postsList[index].image)),
                  title: Text(postsList[index].username,
                      style: TextStyle(color: Colors.orange)),
                  subtitle: Text(postsList[index].message,
                      style: TextStyle(color: Colors.white)),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ComposeScreen()));
            }));
  }

  Future<void> _refresh() {
    if (NewPost().message() != "") {
      UpdatePosts();
      Compose.messagePost = "";
      ScaffoldMessenger.of(context).showSnackBar(postUpdate);
    }
    return Future.delayed(Duration(seconds: 1));
  }

  void UpdatePosts() async {
    setState(() {
      postsList.insert(
          0,
          PostTiles(
              Account().image(), Account().account(), NewPost().message()));
    });
  }
}

class PostTiles {
  PostTiles(this.image, this.username, this.message);

  final String image;
  final String username;
  final String message;
}