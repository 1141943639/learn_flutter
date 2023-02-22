import 'package:learn_flutter/models/ListDataModel.dart';

class DetailToEditArgs {
  List<ListDataModel>? itemList;
  ListDataModel? data;

  DetailToEditArgs({this.itemList, this.data});

  DetailToEditArgs.fromJson(Map<String, dynamic> json) {
    itemList = json['itemList'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemList'] = this.itemList;
    data['data'] = this.data;
    return data;
  }
}
