

import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure, File>> uploadImage({required File? imageUrl});
  Future<Either<Failure, String>> getImage({required File? imageUrl});
}
