import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ZoomableWidget extends StatelessWidget {
  final Widget child;

  const ZoomableWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        PositionedDirectional(
          top: 10.h,
          end: 10.w,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _FullScreenZoomView(child: child),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Color(0x80FFFFFF),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Icon(
                  Icons.zoom_in_map_outlined,
                  size: 30.r,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FullScreenZoomView extends StatefulWidget {
  final Widget child;

  const _FullScreenZoomView({required this.child});

  @override
  State<_FullScreenZoomView> createState() =>
      _FullScreenZoomViewState();
}

class _FullScreenZoomViewState extends State<_FullScreenZoomView> {
  final TransformationController _controller =
      TransformationController();
  double _scale = 1.0;
  final double _step = 0.2;

  void _zoomIn() {
    setState(() {
      _scale += _step;
      _controller.value = Matrix4.identity()..scale(_scale);
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale - _step).clamp(0.5, 5.0);
      _controller.value = Matrix4.identity()..scale(_scale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Zoom View'),
      ),
      body: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              transformationController: _controller,
              minScale: 0.5,
              maxScale: 5.0,
              child: widget.child,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  heroTag: 'zoomIn',
                  onPressed: _zoomIn,
                  child: Icon(Icons.zoom_in),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  heroTag: 'zoomOut',
                  onPressed: _zoomOut,
                  child: Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
