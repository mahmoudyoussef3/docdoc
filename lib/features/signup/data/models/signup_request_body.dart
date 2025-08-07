import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody{
  String name;
  String email;
  String password;
  String gender;
  String phone;

  @JsonKey(name: 'password_confirmation')
  String passwordConfirmation;
  SignupRequestBody({required this.name,required this.phone,required this.email,required this.gender,required this.password,required this.passwordConfirmation});
  Map<String,dynamic> toJson()=>_$SignupRequestBodyToJson(this);
}