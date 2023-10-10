import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:teacher/configs/color.dart';
import 'package:teacher/configs/svg_assets.dart';
import 'package:teacher/hooks/use_initial.dart';

class SplashView extends HookConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goToPage = useCallback(() {
      context.go('/');
    });

    useInitail(() async {
      // goToPage();
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.defaultGradient,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: SvgPicture.string(
                TeacherAppAsset.logo,
                width: MediaQuery.of(context).size.width / 3.5,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.modulate,
                ),
              ),
            ),
            Positioned(
              bottom: 64,
              child: SvgPicture.string(
                TeacherAppAsset.title,
                width: MediaQuery.of(context).size.width / 3.5,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.modulate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
