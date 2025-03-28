import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

Future<File> assetToFile(String assetPath) async {
  try {
    ByteData data = await rootBundle.load(assetPath);
    List<int> bytes = data.buffer.asUint8List();
    
    Directory tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/${assetPath.split('/').last}';
    
    File file = File(filePath);
    await file.writeAsBytes(bytes);
    
    return file;
  } catch (e) {
    throw Exception('Failed to convert asset to file: $e');
  }
}
