import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  _getColumns() {
    return [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Age'), numeric: true),
      DataColumn(label: Text('Salary'))
    ];
  }

  _getRows() {
    return [
      DataRow(cells: [
        DataCell(Text('Shyam')),
        DataCell(Text('21')),
        DataCell(Text('8989'), showEditIcon: true)
      ]),
      DataRow(cells: [
        DataCell(Text('Tim')),
        DataCell(Text('21')),
        DataCell(Text('8989'), showEditIcon: true)
      ]),
      DataRow(cells: [
        DataCell(Text('Ram')),
        DataCell(Text('21')),
        DataCell(Text('8989'), showEditIcon: true)
      ]),
      DataRow(cells: [
        DataCell(Text('Ramesh')),
        DataCell(Text('21')),
        DataCell(Text('8989'), showEditIcon: true)
      ]),
      DataRow(cells: [
        DataCell(Text('Ajay')),
        DataCell(Text('21')),
        DataCell(Text('8989'), showEditIcon: true)
      ]),
      DataRow(cells: [
        DataCell(Text('Sunil')),
        DataCell(Text('21')),
        DataCell(Text('8989'), showEditIcon: true)
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: DataTable(
            sortColumnIndex: 0,
            sortAscending: true,
            columns: _getColumns(),
            rows: _getRows()),
      )),
    );
  }
}
