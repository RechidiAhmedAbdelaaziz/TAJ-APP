part of 'image.dto.dart';

class RemoteImageDTO extends ImageDTO {
  final String _url;
  RemoteImageDTO(this._url);

  @override
  ImageProvider get image => NetworkImage(_url);

  @override
  Future<String> get url async => _url;
}

class RemoteVideoDTO extends VideoDTO {
  final String _url;
  RemoteVideoDTO(this._url);

  @override
  VideoPlayerController get videoController =>
      VideoPlayerController.networkUrl(Uri.parse(_url));

  @override
  Future<String> get url async => _url;
}
