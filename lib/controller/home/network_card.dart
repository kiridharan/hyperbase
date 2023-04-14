import 'package:blockchain/model/home/network.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class NetworkDataSource extends DataGridSource {
  NetworkDataSource({required List<Networks> networks}) {
    _employees = networks
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'name', value: e.name.toString()),
              DataGridCell<String>(columnName: 'Active', value: e.active),
              DataGridCell<String>(columnName: 'Deactive', value: e.deaactive),
              DataGridCell<String>(columnName: 'Date', value: e.date),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.centerLeft,
        // padding: const EdgeInsets.all(16.0),
        child: Text(
          dataGridCell.value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }).toList());
  }
}
