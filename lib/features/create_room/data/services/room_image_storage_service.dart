import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class RoomImageStorageService {
  const RoomImageStorageService();

  Future<String> saveRoomImage(File imageFile) async {
    final appDirectory = await getApplicationDocumentsDirectory();

    final roomImagesDirectory = Directory(
      path.join(appDirectory.path, 'room_images'),
    );

    if (!roomImagesDirectory.existsSync()) {
      await roomImagesDirectory.create(recursive: true);
    }

    final extension = path.extension(imageFile.path).isEmpty
        ? '.jpg'
        : path.extension(imageFile.path);

    final fileName = '${const Uuid().v4()}$extension';

    final savedFile = await imageFile.copy(
      path.join(roomImagesDirectory.path, fileName),
    );

    return savedFile.path;
  }
}