import 'package:economy_v2/app/core/app_config.dart';
import 'package:economy_v2/app/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashAuthPage extends StatefulWidget {
  final AuthController _authController;
  const SplashAuthPage({super.key, required AuthController authController})
      : _authController = authController;

  @override
  State<SplashAuthPage> createState() => _SplashAuthPageState();
}

class _SplashAuthPageState extends State<SplashAuthPage> {
  @override
  void initState() {
    reaction<bool?>((_) => widget._authController.userIsAuthenticated,
        (authenticate) {
      if (authenticate != null && authenticate) {
        Modular.to.navigate('/home/');
      } else {
        Modular.to.navigate('/auth/login/');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._authController.isAuthenticate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppConfig.primaryColor,
        child: Center(
          child: Image.asset("assets/images/white-dollar.png", height: 100),
        ),
      ),
    );
  }
}
