import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn_dev/utils/api_service.dart';
import '../models/post.dart';

class HomeController extends GetxController {
  //Initialising all variables..
  List<Posts>? posts;
  List<Posts>? completeList;
  bool errVar = false;
  bool loading = false;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  //Function to make API calls and set error and loading variables..
  //The widgets will be displayed dynamically according to the condition in variables.
  fetchData() async {
    loading = true;
    posts = await RemoteService().getPosts();
    completeList = await RemoteService().getPosts();
    if(posts != null){
      loading = false;
      update();
    }else{
      errVar = true;
    }
    loading = false;
  }

  //Function to look for the given value inside the title field of the Post Model.
  searchData(String data){
    final suggestions = completeList?.where((post) {
      final postTitle = post.title.toLowerCase();
      final input = data.toLowerCase();
      return postTitle.contains(input);
    }).toList();
    posts = suggestions;
    update();
  }
}
