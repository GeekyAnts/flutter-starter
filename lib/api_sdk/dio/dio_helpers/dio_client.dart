import 'package:flutter_starter/api_sdk/dio/models/user_model.dart';
import 'package:flutter_starter/config/config.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'dio_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET(DioApis.users)
  Future<DioResponseData> getUsers(@Path("id") int id);

  @POST(DioApis.login)
  Future<dynamic> createPost(@Body() dynamic body);
}
