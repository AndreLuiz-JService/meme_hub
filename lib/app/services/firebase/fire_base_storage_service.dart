import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class FirebaseStorageService {
  final logger = Logger();
  final storage = FirebaseStorage.instance;

  Future<String> uploadFile(XFile xfile) async {
    try {
      final file = File(xfile.path);
      final ref = storage.ref().child('images/${xfile.name}');
      await ref.putFile(
        file,
      );
      return await ref.getDownloadURL();
    } catch (e) {
      logger.e(e);
      throw Exception('Erro ao fazer upload da imagem');
    }
  }
}
