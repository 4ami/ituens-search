part of 'remote_models_lib.dart';

abstract class BaseResponse {
  const BaseResponse({required this.code});
  final int code;
}
