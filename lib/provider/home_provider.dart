import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gika/model/home_model.dart';
import 'package:gika/services/api.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier {
  late List<HomeModel> _data = [];
  List<HomeModel> get data => _data;

  Future<List<HomeModel>> fetchListUser() async {
    
    
      Uri uri = Uri.parse(AppUrl.listUrl);
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var resp = json.decode(response.body);
        List userList = resp;
        _data = userList.map((itemList) => HomeModel.fromJson(itemList)).toList();
        // result = _data;
      }else{
        _data=[];
        notifyListeners();
        // result = json.decode(response.body);
      }
   
    notifyListeners();
    return _data;
  }
}
