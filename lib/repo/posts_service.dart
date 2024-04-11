import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// https://api.escuelajs.co/api/v1/auth/login
part 'posts_service.g.dart';
@RestApi(baseUrl: "https://api.escuelajs.co/api/v1/")
abstract class PostsService {
  factory PostsService(Dio dio) = _PostsService;
   @GET("/products")
  Future<dynamic> fetchProducts({
    @Query('categoryId') int? categoryId,}
  );
  // @GET("/posts")
  // Future<dynamic> fetchPosts();
    @POST("/products")
  Future<dynamic> addPost(@Body() Map<String, dynamic> postData);

 
 @POST("auth/login")
  Future<dynamic> userLogin(
    @Body() Map<String,dynamic> postData,
   @Header("Content-Type")String  contentType,
  //  @Header("Authorization") String authorization,
  );
   @PUT("categories/3")
  Future<dynamic> updateData(
    @Body() Map<String,dynamic> postData,
   @Header("Content-Type")String  contentType,
  //  @Header("Authorization") String authorization,
  );

  

  @DELETE("categories/{id}")
  Future<dynamic> delete(
    @Path("id") int id,
    @Body() Map<String,dynamic> postData,
   @Header("Content-Type")String  contentType,
  //  @Header("Authorization") String authorization,
  );

}
