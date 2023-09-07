import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list/users_handler/bloc/user_bloc.dart';
import 'package:users_list/users_handler/pages/user_content_page.dart';
import 'package:users_list/users_handler/pages/user_list_page.dart';
import 'package:users_list/users_handler/repository/api_calls.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({Key? key}) : super(key: key);

  @override
  State<UsersHomePage> createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  @override
  void initState() {
    super.initState();
    UserBloc.instance.add(UserViewEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        bloc: UserBloc.instance,
        builder: (context, state) {
          if (state is UserViewState) {
            var fetchUsersData = getUsersList();
            return FutureBuilder(
              future: fetchUsersData,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return UserListPage(snapshot.data);
                }
                return const Center(
                    child: Text("OOPS Something Went Wrong...."));
              },
            );
          } else if (state is UserContentViewState) {
            var fetchedData = getUserData(state.id);
            return FutureBuilder(
              future: fetchedData,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return UserContentPage(snapshot.data);
                }
                return const Center(
                    child: Text("OOPS Something Went Wrong...."));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
