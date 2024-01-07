part of '../login_page.dart';


class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<_LoginForm, LoginController> {

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormFieldDefault(
            label: 'Email',
            controller: _emailEC,
            validator: Validatorless.multiple([
              Validatorless.email('Digite um email válido!'),
              Validatorless.required('Campo obrigatório')
            ]),
            icon: Icons.email,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldDefault(
            label: 'Senha',
            isPassword: true,
            controller: _senhaEC,
            validator: Validatorless.multiple([
              Validatorless.min(8, 'Senha deve conter no mínimo 8 caracteres!'),
              Validatorless.required('Campo obrigatório!')
            ]),
            icon: Icons.key,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonDefault(
            onPressed: () async {

                final validate = _formKey.currentState?.validate() ?? false;

                if(validate){
                  await controller.signIn(email: _emailEC.text, password: _senhaEC.text);
                  Navigator.of(context).pushNamedAndRemoveUntil('/home/', (route) => false);
                }
            },
            title: 'Entrar',
          ),
        ],
      ),
    );
  }
}
