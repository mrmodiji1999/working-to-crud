import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'posts_service.g.dart';
@RestApi(baseUrl: "https://api.escuelajs.co/api/v1/products/")
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;
   @GET("/")
  Future<dynamic> fetchProducts({
    @Query('categoryId') int? categoryId,}
  );
  // @GET("/posts")
  // Future<dynamic> fetchPosts();
    @POST("/products")
  Future<dynamic> addPost(@Body() Map<String, dynamic> postData);

 
 @POST("auth/login")
  Future<dynamic> userLogin(
    @Body() Map<String, dynamic> postData,
   @Header("Content-Type") String contentType,
  //  @Header("Authorization") String authorization,
  );


}
