import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webkul1/model/post_data_model.dart';
import 'package:webkul1/repo/posts_service.dart';
import 'package:webkul1/ui/homepage.dart';

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

//  static Future<bool> addPost(String name ,passwd) async {
//       final dio = Dio();
//       print('add post se $name $passwd');
//     final postsService = PostsService(dio);

//     try {
//       final headers = {
//         'Content-Type': 'application/json',
//       };

//       final body = {
//         "firstName": name,
//         "lastName": passwd,
//       };

//       final response = await dio.post(
//        'https://jsonplaceholder.typicode.com/posts',
//         options: Options(headers: headers),
//         data: body,
//       );print('i am from dio post method $response');

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print(response);
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       log('Error adding post: $e');
//       return false;
//     }
//   }
  static Future<bool> userlogin(usermode,) async {
      final dio = Dio();
      print('add post se $usermode');
    final postsService = PostsService(dio);

    try {
 
 final Content_Type= 'application/json';

      final body = {
   "email": "john@mail.com",
  "password": "changeme"
      };
       final response = await postsService.userLogin(body,Content_Type ); 
      //  print('i am from dio post method $response');
      //  print(response['access_token']);

      if (response['access_token']!= null) {
        // print(response);
        print('login succes');
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setBool('islogin', true);
        return true;
      } else {
        print('login fail');
        return false;
      }
    } catch (e) {
      log('Error adding post: $e');
      return false;
    }
  }
  
  static Future<bool> updatedata(usermode) async {
      final dio = Dio();
      print('add post se $usermode');
    final postsService = PostsService(dio);

    try {
 
 final Content_Type= 'application/json';

      final body = {
 "name": "Change title"

      };

       final response = await postsService.updateData(body,Content_Type ); 
       print('i am from dio updadte method $response');
      //  print(response['access_token']);

      if (response['access_token']!= null) {
        // print(response);
       //    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PostDataPage()));
             
        print('login succes');
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setBool('islogin', true);
        return true;
      } else {
        print('login fail');
        return false;
      }
    } catch (e) {
      log('Error adding post: $e');
      return false;
    }
  }
}
class materialpageroute extends StatefulWidget {
  const materialpageroute({super.key});

  @override
  State<materialpageroute> createState() => _materialpagerouteState();
}

class _materialpagerouteState extends State<materialpageroute> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [],),);
  }
}