import 'package:flutter/material.dart';
import 'package:todoapp/screens/home.dart';
import '../constants/colors.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: buildAppBar(),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Icon(Icons.menu,color: tdBlack,size: 30,),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar-4.jpg'),
            ),
          )
        ],),
    );
  }
}





class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: 30,
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(25),
    child: Wrap(
      runSpacing: 15,
      children: [
        // const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home(),
          )),
        ),
        ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Favourites'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Favourites(),
              ));
            }
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text('Workflow'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          onTap: () {},
        ),
      ],
    ),
  );
}
