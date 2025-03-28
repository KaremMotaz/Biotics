import 'dart:io';

abstract class StorageService {
  Future<File> uploadFile(File file, String path);
  Future<String> getImage(File file, String path);
}
