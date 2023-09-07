import 'package:flutter/material.dart';
import 'package:users_list/users_handler/bloc/user_bloc.dart';

class UserContentPage extends StatelessWidget {
  var data;
  UserContentPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(data['avatar']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("First Name: ${data['first_name']}"),
                Text("Last Name: ${data['last_name']}"),
              ],
            ),
            Text("User Id: ${data['id']}"),
            Text("Email: ${data['email']}"),
            GestureDetector(
              child: Text(
                "Back to Users List",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.indigo,
                ),
              ),
              onTap: () {
                UserBloc.instance.add(UserViewEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
