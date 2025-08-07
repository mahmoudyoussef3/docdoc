import 'package:dartz/dartz.dart';
import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_error_model.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/login/data/models/login_response_body.dart';
import 'package:docdoc/features/signup/data/models/signup_request_body.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);
  Future<Either<ErrorHandler, LoginResponseBody>> signup(
      SignupRequestBody signupDataModel) async {
    try {
      final response = await _apiService.signup(signupDataModel);
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
