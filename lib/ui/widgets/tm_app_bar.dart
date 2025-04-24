import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_management/ui/controllers/auth_controller.dart';
import 'package:task_management/ui/screens/login_screen.dart';

import '../screens/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSize {
  const TMAppBar({super.key, this.fromProfileScreen});

  final bool? fromProfileScreen;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromProfileScreen ?? false) {
            return;
          }
          _onTabProfileSection(context);
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: _shouldShowImage(AuthController.userModel?.photo)? MemoryImage(
                base64Decode(AuthController.userModel?.photo ?? ''),
              ) : null
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fullName ?? 'Unknown',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                  Text(
                    AuthController.userModel?.email ?? 'Unknown',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _onTabLogOutButton(context),
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldShowImage(String? photo){
    return photo != null && photo.isNotEmpty;
  }

  void _onTabProfileSection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
    );
  }

  Future<void> _onTabLogOutButton(BuildContext context) async {
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (predicate) => false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
