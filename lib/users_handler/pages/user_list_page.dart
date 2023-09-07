import 'package:flutter/material.dart';
import 'package:users_list/users_handler/bloc/user_bloc.dart';

var send_data = [];

class UserListPage extends StatelessWidget {
  final data;
  UserListPage(this.data, {super.key});
  final DataTableSource _data = MyData();
  @override
  Widget build(BuildContext context) {
    send_data = data;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PaginatedDataTable(
          source: _data,
          header: const Text('My Products'),
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Content')),
          ],
          columnSpacing: MediaQuery.of(context).size.width / 8,
          horizontalMargin: 10,
          rowsPerPage: 6,
          showCheckboxColumn: false,
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final List _data = send_data;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    print(_data[index]['id']);
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["email"])),
      DataCell(GestureDetector(
        child: Text(
          "Go",
          style: TextStyle(
              color: Colors.indigo, decoration: TextDecoration.underline),
        ),
        onTap: () {
          UserBloc.instance.add(UserContentViewEvent(id: _data[index]['id']));
        },
      )),
    ]);
  }
}
