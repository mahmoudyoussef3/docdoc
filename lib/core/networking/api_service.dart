import 'package:dio/dio.dart';
import 'package:docdoc/features/login/data/models/login_response_body.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/login/data/models/login_request_body.dart';
import 'api_constants.dart';
//this class called _ApiService will be generated using retrofit package
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
      @Body() LoginRequestBody loginRequestBody,
      );


}