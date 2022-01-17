// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gika/model/detail_model.dart';
import 'package:gika/services/api.dart';
import 'package:http/http.dart' as http;
class DetailUserProvider extends ChangeNotifier {

  DetailModel? _data;
  DetailModel? get data => _data;

  Future<DetailModel> getDetail(int index) async {
    var result;
    Uri uri = Uri.parse(AppUrl.detailUrl(index));
      final response = await http.get(
        uri
      );
      // result = json.decode(response.body);
      if (response.statusCode == 200) {
        var item = json.decode(response.body);
        // print('hasilnya'+item);
        _data = DetailModel.fromJson(item);
        // _data = result;
        
        notifyListeners();
      } else {
        // print(json.decode(response.body));
        
        notifyListeners();
      }
    
    notifyListeners();
    return result;
  }
}
