import 'package:flutter/material.dart';


class QFShowSupplyDemandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QFShowSupplyDemandPageState();
}
 
class QFShowSupplyDemandPageState extends State<QFShowSupplyDemandPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // return   MaterialApp(
      // home:   DefaultTabController(
      //   length: choices.length,
      //   child:   Scaffold(
      //     appBar:   AppBar(
      //       title: const Text('Tabbed AppBar'),
      //       bottom:   TabBar(
      //         isScrollable: true,
      //         tabs: choices.map((Choice choice) {
      //           return   Tab(
      //             text: choice.title,
      //             icon:   Icon(choice.icon),
      //           );
      //         }).toList(),
      //       ),
      //     ),
      //     body:   TabBarView(
      //       children: choices.map((Choice choice) {
      //         return   Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child:   ChoiceCard(choice: choice),
      //         );
      //       }).toList(),
      //     ),
      //   ),
      // ),
    // );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return   Card(
      color: Colors.white,
      child:   Center(
        child:   Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Icon(choice.icon, size: 128.0, color: textStyle.color),
              Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(  QFShowSupplyDemandPage());
}
