import 'package:DataBaseApp/DataBase_helper/db_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbhelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            RaisedButton(
                child: Text('Insert'),
                onPressed: () {
                  _insert();
                }),
            RaisedButton(
                child: Text('Query'),
                onPressed: () {
                  _query();
                }),
            RaisedButton(
                child: Text('Update'),
                onPressed: () {
                  _update();
                }),
            RaisedButton(
                child: Text('Delete'),
                onPressed: () {
                  _delete();
                }),
          ],
        ),
      ),
    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "Adam",
      DatabaseHelper.columnAge: 25
    };
    final id = await dbhelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbhelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: "Yohan",
      DatabaseHelper.columnAge: 22
    };
    final rowsAffected = await dbhelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    final id = await dbhelper.queryRowCount();
    final rowsDeleted = await dbhelper.delete(id);
    print('deleted $rowsDeleted row(s), row $id');
  }
}
