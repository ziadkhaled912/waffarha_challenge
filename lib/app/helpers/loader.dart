import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waffarha_challenge/app/helpers/app_colors.dart';

class Loader {
  Loader._();

  late BuildContext _context;
  late BuildContext _dismissingContext;
  Completer<dynamic> waitForLoader = Completer()..complete();

  static Loader _instance = Loader._();

  static Loader get instance => _instance;

  static void newInstance() => _instance = Loader._();

  void hide() {
    if (!waitForLoader.isCompleted) {
      try {
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop(true);
        }
      } catch (_) {}
    }
  }

  void show(BuildContext context) {
    _context = context;
    if (waitForLoader.isCompleted) {
      waitForLoader = Completer();
      showDialog<dynamic>(
        context: _context,
        barrierDismissible: false,
        builder: (context) {
          _dismissingContext = context;
          return PopScope(
            onPopInvoked: (_) async => false,
            child: const LoadingImage(),
          );
        },
      );
    }
  }
}

class LoadingImage extends StatefulWidget {
  const LoadingImage({super.key});

  @override
  State<LoadingImage> createState() => _LoadingImageState();
}

class _LoadingImageState extends State<LoadingImage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 75,
        height: 75,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.white,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.mainPrimary,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (!Loader.instance.waitForLoader.isCompleted) {
      Loader.instance.waitForLoader.complete();
    }
    super.dispose();
  }
}
