part of '../home_page.dart';

class _HomeDrawer extends StatelessWidget {

  const _HomeDrawer({ super.key });

   @override
   Widget build(BuildContext context) {
       return Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Olá')),
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