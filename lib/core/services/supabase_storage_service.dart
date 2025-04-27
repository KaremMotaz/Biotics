import 'dart:io';

import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../helpers/constants.dart';
import '../helpers/keys.dart';
import 'storage_service.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    List<Bucket> bucket = await _supabase.client.storage.listBuckets();

    bool isBucketExist = false;

    for (Bucket mybucket in bucket) {
      if (mybucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  @override
  Future<File> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String urlToSupabase = await _supabase.client.storage
        .from(kBucketName)
        .upload('$path/$fileName', file);
    return File(urlToSupabase);
  }

  @override
  Future<String> getImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String urlFromSupabase = _supabase.client.storage
        .from(kBucketName)
        .getPublicUrl('$path/$fileName');
    return urlFromSupabase;
  }
}
