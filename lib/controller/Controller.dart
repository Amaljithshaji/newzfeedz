import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newzfeedz/models/Newsmodel.dart';

class Controller with ChangeNotifier {
  bool isloading = false;
  Newmodel? responsedata;
  int count =0;
  Future<dynamic> fetchdata({required String cate }) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$cate&apiKey=5c544eb5316e4b0780f752c2c50455e3");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      print(response.body);
      responsedata = Newmodel.fromJson(decodedata);
    }
    isloading = false;
    notifyListeners();
  }
   Future<dynamic> searchdata({required String search }) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?q=$search&apiKey=5c544eb5316e4b0780f752c2c50455e3");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      print(response.body);
      responsedata = Newmodel.fromJson(decodedata);
    }
    isloading = false;
    notifyListeners();
  }
  Addcount(){
    count++;
  }
}
