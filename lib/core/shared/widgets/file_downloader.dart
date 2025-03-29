import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taj_elsafa/core/extension/snackbar.extension.dart';

class FileDownloader extends StatefulWidget {
  final String url;
  final String fileName;
  final Widget Function(BuildContext context, bool isDownloading)
  builder;

  const FileDownloader({
    super.key,
    required this.url,
    required this.fileName,
    required this.builder,
  });

  @override
  State<FileDownloader> createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _isDownloading ? null : _startDownload,
      child: widget.builder(context, _isDownloading),
    );
  }

  void _startDownload() async {
    setState(() {
      _isDownloading = true;
    });

    Directory? downloadsDir =
        await getApplicationDocumentsDirectory();

    String savePath =
        "${downloadsDir.path}/Download/${widget.fileName}";

    await locator<Dio>().download(widget.url, savePath);

    setState(() {
      _isDownloading = false;
      context.showSuccessSnackbar("File downloaded successfully");
    });
  }
}
