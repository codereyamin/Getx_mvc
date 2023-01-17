import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:getx_mvc/const/server_url.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../models/search_model.dart';

class SearchController extends GetxController {
  var isloading = true.obs;
  SearchData? data;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    var box = await Hive.openBox('data');
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        var response = await http.get(Uri.parse(ServerUrl.serverUel));
        if (response.statusCode == 200) {
          await box.delete("mydata");
          var results = jsonDecode(response.body);
          await box.put("mydata", results);
          var local = await box.get("mydata");
          data = SearchData.fromJson(local);

          Timer(
            const Duration(seconds: 5),
            () {
              isloading(false);
            },
          );
        }
      } catch (e) {
        print(e);
      } finally {
        Timer(
          const Duration(seconds: 5),
          () {
            isloading(false);
          },
        );
      }
    } else {
      var local = await box.get("mydata");
      data = SearchData.fromJson(local);
      Timer(
        const Duration(seconds: 5),
        () {
          isloading(false);
        },
      );
    }
  }
}
