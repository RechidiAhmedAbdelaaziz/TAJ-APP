part of 'image.dto.dart';

abstract class LocalImageDTO extends ImageDTO {
  final XFile file;

  LocalImageDTO({required this.file});

  // convert the file to a base64 string
  @override
  Future<String> get url async =>
      await file.readAsBytes().then((value) => base64Encode(value));
}

class MobileImageDTO extends LocalImageDTO {
  MobileImageDTO({required super.file});

  @override
  ImageProvider get image => FileImage(File(file.path));
}

class WebImageDTO extends LocalImageDTO {
  WebImageDTO({required super.file});

  @override
  ImageProvider get image => NetworkImage(file.path);
}

abstract class LocalVideoDTO extends VideoDTO {
  final XFile file;
  final _cloudStorageService = locator<VideoCloudStorageService>();

  LocalVideoDTO({required this.file});

  @override
  Future<String> get url async =>
      await _cloudStorageService.upload(file);
}

class MobileVideoDTO extends LocalVideoDTO {
  MobileVideoDTO({required super.file});

  @override
  VideoPlayerController get videoController =>
      VideoPlayerController.file(File(file.path));
}

class WebVideoDTO extends LocalVideoDTO {
  WebVideoDTO({required super.file});

  @override
  VideoPlayerController get videoController =>
      VideoPlayerController.networkUrl(Uri.parse(file.path));
}
