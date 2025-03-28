import 'dart:io';

import 'package:biocode/core/errors/failure.dart';
import 'package:biocode/core/errors/server_failure.dart';
import 'package:biocode/core/helpers/backend_endpoint.dart';
import 'package:biocode/core/repos/images_repo/images_repo.dart';
import 'package:biocode/core/services/storage_service.dart';
import 'package:dartz/dartz.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;
  ImagesRepoImpl({required this.storageService});

  @override
  Future<Either<Failure, File>> uploadImage({required File? imageUrl}) async {
    try {
      File url = await storageService.uploadFile(
          imageUrl!, BackendEndpoint.studentsImages);
      return right(url);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getImage({required File? imageUrl}) async {
    try {
      String getUrl = await storageService.getImage(
          imageUrl!, BackendEndpoint.studentsImages);
      return right(getUrl);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
