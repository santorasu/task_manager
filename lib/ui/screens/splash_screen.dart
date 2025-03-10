import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/ui/utils/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Task Manager"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SvgPicture.asset(
          width: double.maxFinite,
          height: double.maxFinite,
          AssetsPath.backgroundSvg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
