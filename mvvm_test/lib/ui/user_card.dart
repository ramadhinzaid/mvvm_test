import 'package:flutter/material.dart';
import 'package:mvvm_test/model/MUser.dart';

class UserCard extends StatelessWidget {
  final MUser user;
  UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
        BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 7)
      ]),
      child: Row(
        children: [
          Container(
            width: 75,
            margin: EdgeInsets.only(right: 10),
            height: 75,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(user.avatar))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama :"+ user.firstName + " "+ user.lastName),
              Text("Email :"+ user.email)
            ],
          )
        ],
      ),
    );
  }
}
