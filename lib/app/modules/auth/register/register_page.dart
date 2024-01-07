import 'package:economy_v2/app/core/app_config.dart';
import 'package:economy_v2/app/core/widgets/button_default.dart';
import 'package:economy_v2/app/core/widgets/text_form_field_default.dart';
import 'package:economy_v2/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _repeatPasswordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConfig.primaryColor,
        title: const Text('Criar a minha conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
               TextFormFieldDefault(
                label: 'Nome completo',
                controller: _nameEC,
                validator: Validatorless.multiple([
                  Validatorless.required("Campo obrigatório")
                ]),
                icon: Icons.person,
              ),
              const SizedBox(
                height: 13,
              ),
               TextFormFieldDefault(
                label: 'Email',
                controller: _emailEC,
                validator:  Validatorless.multiple([
                  Validatorless.email('Digite um email válido!'),
                  Validatorless.required("Campo obrigatório!")
                ]),
                icon: Icons.email,
              ),
              const SizedBox(
                height: 13,
              ),
               TextFormFieldDefault(
                label: 'Senha',
                isPassword: true,
                controller: _passwordEC,
                validator:  Validatorless.multiple([
                  Validatorless.min(8, 'Senha deve conter pelo menos 8 caracteres!'),
                  Validatorless.required("Campo obrigatório")
                ]),
                icon: Icons.key,
              ),
              const SizedBox(
                height: 13,
              ),
               TextFormFieldDefault(
                label: 'Digite a senha novamente',
                isPassword: true,
                controller: _repeatPasswordEC,
                icon: Icons.key,
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonDefault(
                title: 'Criar conta',
                onPressed: () {
                  final validate = _formKey.currentState?.validate() ?? false;
                  if(validate){
                    controller.signUp(email: _emailEC.text, password: _passwordEC.text);
                    Navigator.of(context).pushNamedAndRemoveUntil('/auth/login/', (route) => false);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
