import 'package:biocode/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try again later!");
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try again later!');
    } else {
      return ServerFailure("Opps There was an Error, Please try again later!");
    }
  }
}
