import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final NBBIndexfinal = Provider.of<NBBIndex>(context,listen:true);
    int _currentIndex = NBBIndexfinal.currentIndex;

    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(children:[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/assistant.png',
                height:55.0,
                filterQuality: FilterQuality.high,
              ),
            ),
            Padding(padding: const EdgeInsets.all(16.0),
              child: Text(
                'Assistant',
                style: Theme.of(context).textTheme.headline4,

              ),
            )
          ],
        ),
        _SideMenuIconTab(
          iconData: Icons.supervised_user_circle_outlined,
          title: 'Profile',
          onTap: (){
            NBBIndexfinal.changeIndex(0);
          },
        ),
        _SideMenuIconTab(
          iconData: Icons.summarize,
          title: 'Course Summary',
          onTap: (){
            NBBIndexfinal.changeIndex(1);
          },
        ),
        _SideMenuIconTab(
          iconData: Icons.search,
          title: 'Search Record',
          onTap: (){
            NBBIndexfinal.changeIndex(2);
          },
        ),


        _SideMenuIconTab(
          iconData: Icons.print,
          title: 'Print record',
          onTap: () {
            NBBIndexfinal.changeIndex(3);
          }
              /* => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Print record'),
              content:  TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Student UID',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),

               */


        ),


      ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
