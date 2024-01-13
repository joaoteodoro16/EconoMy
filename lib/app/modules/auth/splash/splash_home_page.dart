import 'package:economy_v2/app/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashAuthPage extends StatefulWidget {
  final AuthController _authController;
  const SplashAuthPage({ super.key, required AuthController authController }) : _authController = authController;

  @override
  State<SplashAuthPage> createState() => _SplashAuthPageState();
}

class _SplashAuthPageState extends State<SplashAuthPage> {

    @override
  void initState() {

    reaction<bool?>((_) => widget._authController.userIsAuthenticated, (authenticate) {
      if(authenticate!= null && authenticate){
        if(widget._authController.wallet !=null){
            Modular.to.navigate('/home/', arguments: widget._authController.wallet);
          } else{
            Modular.to.navigate('/wallet/');
          }
      }else{
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
           appBar: AppBar(title: const Text('Splash Auth Page'),),
           body: Container(),
       );
  }
}