// import 'package:firebase_database/firebase_database.dart';

class Post {
  // final database = FirebaseDatabase.instance.reference();
  String date;
  String mssg;
  String header;

  Post({
    required this.date,
    required this.mssg,
    required this.header,
  });
}

List<Post> Posts = [
  Post(
    date: "9/21",
    mssg: "PHP 100,000 was deposited to your account.",
    header: "Deposited",
  ),
  Post(
    date: "9/20",
    mssg: "PHP 6,000 was withdrawn from your account.",
    header: "Withdraw",
  ),
  Post(
    date: "9/18",
    mssg: "JIG account was updated",
    header: "Account",
  ),
  
  Post(
    date: "9/15",
    mssg: "PHP 34,000 was transferred from your account",
    header: "Transfer Money",
  ),
  Post(
    date: "9/10",
    mssg: "JIG account successfully created",
    header: "Account",
  ),
];
