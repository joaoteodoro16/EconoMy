part of '../home_page.dart';

class _HomeDrawer extends StatelessWidget {
  final HomeController controller;
  
  const _HomeDrawer({ super.key, required this.controller});

   @override
   Widget build(BuildContext context) {
       return Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: ()async{
                  await Navigator.of(context).pushNamed('/wallet/', arguments: controller.wallet);
                  await controller.getAll();
              },
              title: const Text('Alterar minha renda'),
            ),
            ListTile(
              onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil('/auth/login/', (route) => false);
              },
              title: const Text('Sair'),
            )
          ],
        ),
       );
  }
}