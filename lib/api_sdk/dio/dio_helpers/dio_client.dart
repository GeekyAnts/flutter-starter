import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../config/config.dart';
import 'dio_apis.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET(DioApis.users)
  Future<dynamic> getUsers(@Path("id") int id);

  @POST(DioApis.login)
  Future<dynamic> loginUser(@Body() dynamic body);

  @POST(DioApis.register)
  Future<dynamic> registerUser(@Body() dynamic body);
}
