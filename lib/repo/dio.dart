import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:webkul1/model/post_data_model.dart';
import 'package:webkul1/repo/posts_service.dart';

class PostsRepo {
  static Future<List<Welcome>> fetchPosts(int value) async {
    final dio = Dio();
    final postsService = PostsService(dio);

    try {
      final dynamic responseData = await postsService.fetchProducts(categoryId: value);
print('????outer response = >>> $responseData');
      if (responseData is List) {
        print('data in listform>>>>>>> ${responseData}');
   
        return responseData
            .map((data) => 
            
            Welcome.fromJson(data))
            .toList();
      } else if (responseData is Map<String, dynamic>) {
        print('data in objectfrom ${responseData}');
       
        return [Welcome.fromJson(responseData)];
      } else {
        log('Unexpected response format: $responseData');
        return [];
      }
    } catch (e) {
      log('Error fetching posts: $e');
      return [];
    }
  }

 static Future<bool> addPost(String name ,passwd) async {
      final dio = Dio();
      print('add post se $name $passwd');
    final postsService = PostsService(dio);

    try {
      final headers = {
        'Content-Type': 'application/json',
      };

      final body = {
        "firstName": name,
        "lastName": passwd,
      };

      final response = await dio.post(
       'https://jsonplaceholder.typicode.com/posts',
        options: Options(headers: headers),
        data: body,
      );print('i am from dio post method $response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error adding post: $e');
      return false;
    }
  }
  static Future<bool> userlogin(usermode) async {
      final dio = Dio();
      print('add post se $usermode');
    final postsService = PostsService(dio);

    try {
      final headers = {
        'Content-Type': 'application/json',
      };

      final body = {
   "email": "john@mail.com",
  "password": "changeme"



  
      };

     
       Response response = await postsService.userLogin(body, headers.toString());
       
       print('i am from dio post method $response');

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error adding post: $e');
      return false;
    }
  }
}
