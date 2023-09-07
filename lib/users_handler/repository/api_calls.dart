import 'dart:convert';

import 'package:http/http.dart' as http;

getUserData(int id) async {
  final responseList =
      await http.get(Uri.parse("https://reqres.in/api/users/$id"));
  return jsonDecode(responseList.body)["data"];
}

getUsersList() async {
  var responseFirstList =
      await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
  var responseSecondList =
      await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  var firstList = jsonDecode(responseFirstList.body)["data"];
  var secondList = jsonDecode(responseSecondList.body)["data"];
  var resultList = List.from(firstList)..addAll(secondList);
  return resultList;
}
