import 'package:flutter/material.dart';
import 'postsText.dart';

class PostBox extends StatelessWidget {
  final Post post;
  const PostBox({Key? key, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFE58B8E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE58B8E))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Flexible(
                child: Text('Add long text here',
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.fade,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.header,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: const Color(0xFFF3F1ED),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    post.mssg,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: const Color(0xFF231D25),
                      fontSize: 15,
                    )
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.date,
                    style: TextStyle(
                      color: const Color(0xFF231D25),
                      fontSize: 20,
                    )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
