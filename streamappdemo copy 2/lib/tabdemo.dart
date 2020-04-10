import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  @override
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController tc;

  _getTabOne() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightGreenAccent, Colors.yellowAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Center(
        child: Container(
          child: Text(
            'Tab One ',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }

  _getTabTwo() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        ),
        ListTile(
          title: Text('First'),
        )
      ],
    );
  }

  _getTabThree() {
    return Container(
      child: Image.network(
          'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png'),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tc = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Demo'),
        bottom: TabBar(
          //isScrollable: true,
          controller: tc,
          labelColor: Colors.tealAccent,
          unselectedLabelColor: Colors.white,
          tabs: <Widget>[
            Tab(
                icon: Icon(
              Icons.home,
              size: 20,
              color: Colors.red,
            )),
            Tab(
                icon: Icon(
              Icons.person,
              size: 20,
              color: Colors.yellowAccent,
            )),
            Tab(
                icon: Icon(
              Icons.account_balance,
              size: 20,
              color: Colors.white,
            ))
          ],
        ),
      ),
      body: TabBarView(
        children: [_getTabOne(), _getTabTwo(), _getTabThree()],
        controller: tc,
      ),
    );
  }
}
