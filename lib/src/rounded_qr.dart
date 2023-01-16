library rounded_qr;

import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:qr/qr.dart';

import 'package:rounded_qr/src/rounded_qr_painter.dart';

class RoundedQR extends StatefulWidget {
  /// The data to be encoded inside the QR code.
  final String data;

  /// The size of the widget.
  final double? size;

  /// The QR code version (1 to 40).
  final int? typeNumber;

  /// The level or error correction.
  final int? errorCorrectLevel;

  /// The number of modules used for the quit zone.
  final int? quietZone;

  /// The color of the modules.
  /// NOTE: The modules need to be darker then the background to make sure all QR code scanners can read it correctly.
  final Color? moduleColor;

  /// The border radius of the modules.
  final double? moduleRadius;

  /// The color of the background.
  /// NOTE: The modules need to be darker then the background to make sure all QR code scanners can read it correctly.
  final Color? backgroundColor;

  /// The border radius of the background.
  final double? backgroundRadius;

  /// Image in the center of the QR code.
  final ImageProvider? image;

  RoundedQR({
    Key? key,
    required this.data,
    this.size = 200,
    this.typeNumber = 1,
    this.errorCorrectLevel = QrErrorCorrectLevel.M,
    this.quietZone = 4,
    this.moduleColor = Colors.black,
    this.moduleRadius = 2.0,
    this.backgroundColor = Colors.white,
    this.backgroundRadius = 8.0,
    this.image,
  }) : super(key: key);

  @override
  _RoundedQRState createState() => _RoundedQRState();
}

class _RoundedQRState extends State<RoundedQR> {
  Future<ui.Image> _loadImage(BuildContext buildContext) async {
    final completer = Completer<ui.Image>();

    final stream = widget.image!.resolve(
      ImageConfiguration(
        devicePixelRatio: MediaQuery.of(buildContext).devicePixelRatio,
      ),
    );

    stream.addListener(
      ImageStreamListener(
        (imageInfo, error) {
          completer.complete(imageInfo.image);
        },
        onError: (dynamic error, _) {
          completer.completeError(error);
        },
      ),
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.image == null) {
      return CustomPaint(
        size: Size(
          widget.size!,
          widget.size!,
        ),
        painter: RoundedQRPainter(
          data: widget.data,
          typeNumber: widget.typeNumber!,
          errorCorrectLevel: widget.errorCorrectLevel!,
          quietZone: widget.quietZone!,
          moduleColor: widget.moduleColor!,
          moduleRadius: widget.moduleRadius!,
          backgroundColor: widget.backgroundColor!,
          backgroundRadius: widget.backgroundRadius!,
        ),
      );
    }

    return FutureBuilder(
      future: _loadImage(context),
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        if (snapshot.hasData) {
          return CustomPaint(
            size: Size(
              widget.size!,
              widget.size!,
            ),
            painter: RoundedQRPainter(
              data: widget.data,
              typeNumber: widget.typeNumber!,
              errorCorrectLevel: widget.errorCorrectLevel!,
              quietZone: widget.quietZone!,
              moduleColor: widget.moduleColor!,
              moduleRadius: widget.moduleRadius!,
              backgroundColor: widget.backgroundColor!,
              backgroundRadius: widget.backgroundRadius!,
              image: snapshot.data,
            ),
          );
        }

        return CustomPaint(
          size: Size(
            widget.size!,
            widget.size!,
          ),
          painter: RoundedQRPainter(
            data: widget.data,
            typeNumber: widget.typeNumber!,
            errorCorrectLevel: widget.errorCorrectLevel!,
            quietZone: widget.quietZone!,
            moduleColor: widget.moduleColor!,
            moduleRadius: widget.moduleRadius!,
            backgroundColor: widget.backgroundColor!,
            backgroundRadius: widget.backgroundRadius!,
          ),
        );
      },
    );
  }
}
