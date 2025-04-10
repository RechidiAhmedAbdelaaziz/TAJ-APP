part of 'image.dto.dart';

abstract class LocalImageDTO extends ImageDTO {
  final XFile file;
  final _cloudStorageService = locator<ImageCloudStorageService>();

  LocalImageDTO({required this.file});

  @override
  Future<String> get url async =>
      await _cloudStorageService.upload(file);
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
