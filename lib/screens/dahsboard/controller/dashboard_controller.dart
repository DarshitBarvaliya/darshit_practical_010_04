import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../Model/category_model.dart';

class DashBoardController extends GetxController{
  @override
  void onInit() {
    UserCategory();
    super.onInit();
  }
  var categoryList = <Category>[].obs;
  var subcategoryList = <SubCategory>[].obs;
  Future <void> UserCategory()async {
    final response = await http.post(Uri.parse("http://esptiles.imperoserver.in/api/API/Product/DashBoard"),
        body: json.encode({
          "CategoryId":0,
          "DeviceManufacturer":"Google",
          "DeviceModel":"Android SDK built for x86",
          "DeviceToken":" ",
          "PageIndex":1
        }), headers : {
        'Content-Type': 'application/json'
        });

    try{
      if(response.statusCode == 200){
        var data = categoryListFromJson(response.body);
        var category = data.result?.category ?? [];
        categoryList.value = category;
        GetCategoryById(page: 1, id: category[0].id);
        //print("success :: ${response.body}");
      }else{
        print("error");
      }
    }catch(e){
      print("error :: ${e}");
    }

  }

  Future <void> GetCategoryById({int? page,int?id})async {
    final response = await http.post(Uri.parse("http://esptiles.imperoserver.in/api/API/Product/DashBoard"),
        body: json.encode({
          "CategoryId":id,
          "PageIndex": page
        }), headers : {
          'Content-Type': 'application/json'
        });

    try{
      if(response.statusCode == 200){
        var data = categoryListFromJson(response.body);
        var category = data.result?.category ?? [];
        subcategoryList.value = category[0].subCategories!;
        print("success :: ${response.body}");
      }else{
        print("error");
      }
    }catch(e){
      print("error :: ${e}");
    }

  }

}