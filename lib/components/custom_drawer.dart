import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gawe/utils/constants.dart';
import 'package:gawe/utils/functions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : 15.0, vertical: 75),
        child: Column(
          children: [
             Row(
               children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Constants.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('A')
                  )
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama orang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('Kerjanya opoo rek?', style: TextStyle(fontSize: 16),)
                  ],
                )
               ],
             ),
             const SizedBox(height: 35),
             const DrawerItem(
              itemIcon: Icon(Icons.person, size: 30),
              itemName: 'Profile',
             ),
             const DrawerItem(
              itemIcon: Icon(Icons.insert_chart_outlined_rounded, size: 30),
              itemName: 'My Stats',
             ),
             DrawerItem(
              itemIcon: Icon(Icons.settings, size: 30),
              itemName: 'Settings',
             ),
             const Spacer(),
             Center(
              child: InkWell(
                onTap: () async {
                  await signOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.exit_to_app_outlined, color: Colors.red,),
                    SizedBox(width: 10),
                    Text("Log Out", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.red
                        )
                    ),
                    ],
                  )
                )
             ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String itemName;
  final Icon itemIcon;
  final Function()? onTap;
  const DrawerItem({
    super.key, required this.itemName, required this.itemIcon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
       onTap: onTap,
       child: Row(
         children: [
           itemIcon,
           const SizedBox(width: 25,),
           Text(itemName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16))
         ],
       ),
      ),
    );
  }
}