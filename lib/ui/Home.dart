import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_test/bloc/userBloc.dart';
import 'package:mvvm_test/model/MUser.dart';
import 'package:mvvm_test/ui/user_card.dart';

class HomePage extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              bloc.dispatch(random.nextInt(10) + 1);
            },
            child: Text("Pick Random User"),
          ),
          BlocBuilder<UserBloc, MUser>(
              builder: (context, user) =>
                  (user is UninitializedUser) ? Container() : UserCard(user))
        ],
      ),
    );
  }
}
