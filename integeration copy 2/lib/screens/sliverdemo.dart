import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    const names = [
      "ram",
      "shyam",
      "tim",
      "sohan",
      "mohan",
      "kim",
      "vim",
      "rim",
      "sim",
      "jim"
    ];
    const logo =
        'https://www.logolynx.com/images/logolynx/17/17f5ca186cb13a65eea58598b66a1446.png';
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: media.height * 0.35,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver App Bar',
                style: TextStyle(fontSize: 30),
              ),
              titlePadding: EdgeInsets.all(10),
              background: Image.network(
                logo,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.tealAccent[100 * (index % 9)],
                child: Text(
                  names[index],
                  style: TextStyle(fontSize: 40),
                ),
              );
            }, childCount: names.length),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4),
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                  child: Text(names[index], style: TextStyle(fontSize: 40)),
                  alignment: Alignment.center,
                  color: Colors.red[100 * (index % 7)]);
            }, childCount: names.length),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.deepOrange,
              padding: EdgeInsets.all(20),
              child: Text(
                'Brain Mentors',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Image.network(logo),
          )
        ],
      )),
    );
  }
}
