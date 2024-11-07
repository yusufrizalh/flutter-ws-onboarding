import 'package:flutter/material.dart';
import 'package:flutter_onboarding/tabs/calls.dart';
import 'package:flutter_onboarding/tabs/chat.dart';
import 'package:flutter_onboarding/tabs/updates.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> with TickerProviderStateMixin {
  TabController? tabController;

  //* all tab bars
  static const List<Widget> widgetTabBar = <Widget>[
    Expanded(child: ChatPage()),
    Expanded(child: UpdatesPage()),
    Expanded(child: CallsPage()),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController!.animateTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // title: Text('Inbox'),
          // centerTitle: true,
          backgroundColor: Colors.teal,
          elevation: 8,
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            indicatorWeight: 3,
            indicatorColor: Colors.white,
            isScrollable: false,
            controller: tabController,
            tabs: <Tab>[
              Tab(icon: Icon(Icons.chat), child: Text('Chat')),
              Tab(icon: Icon(Icons.update), child: Text('Updates')),
              Tab(icon: Icon(Icons.call), child: Text('Calls')),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: BouncingScrollPhysics(),
          children: widgetTabBar,
        ),
      ),
    );
  }
}
