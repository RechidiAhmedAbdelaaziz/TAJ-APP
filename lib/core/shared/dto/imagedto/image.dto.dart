import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/services/cloudstorage/cloud_storage.service.dart';
import 'package:taj_elsafa/core/shared/widgets/image_widget.dart';
import 'package:taj_elsafa/core/shared/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';

part 'local_image.dto.dart';
part 'remote_image.dto.dart';

abstract class MediaDTO {
  Widget buildWidget({
    required double width,
    required double height,
    double borderRadius = 0,
  });

  Future<String> get url;

}

abstract class ImageDTO extends MediaDTO {
  ImageProvider get image;

  @override
  Widget buildWidget({
    required double width,
    required double height,
    double borderRadius = 0,
  }) {
    return ImageWidget(
      image: image,
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }

 
}

abstract class VideoDTO extends MediaDTO {
  VideoPlayerController get videoController;

  @override
  Widget buildWidget({
    required double width,
    required double height,
    double borderRadius = 0,
  }) {
    return VideoWidget(
      controller: videoController,
      showControls: true,
      autoPlay: true,
      loop: true,
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }
}

extension FileDtoMapper on List<MediaDTO> {
  Future<List<String>> get urls async {
    return Future.wait(map((e) => e.url));
  }
}
