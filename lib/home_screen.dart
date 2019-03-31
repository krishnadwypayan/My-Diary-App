import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

final List<MemoryCard> tempCards = [
  MemoryCard(
    DateTime.now(),
    "Fun Times with Friends",
    "Lorem ipsum fdxgcjh ljliunk jnbyukfd tres",
    "Happy",
    [],
  ),
  MemoryCard(
    DateTime.now(),
    "Fun Times with Friends",
    "Lorem ipsum fdxgcjh ljliunk jnbyukfd tres",
    "Bleh",
    [],
  ),
  MemoryCard(
    DateTime.now(),
    "Fun Times with Friends",
    "Lorem ipsum fdxgcjh ljliunk jnbyukfd tres",
    "Sad",
    [],
  ),
  MemoryCard(
    DateTime.now(),
    "Fun Times with Friends",
    "Lorem ipsum fdxgcjh ljliunk jnbyukfd tres",
    "Very Happy",
    [],
  ),
  MemoryCard(
    DateTime.now(),
    "Fun Times with Friends",
    "Lorem ipsum fdxgcjh ljliunk jnbyukfd tres",
    "Not So Great",
    [],
  ),
  MemoryCard(
    DateTime.now(),
    "Fun Times with Friends",
    "Lorem ipsum fdxgcjh ljliunk jnbyukfd tres",
    "Sad",
    [],
  ),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  
  bool createDiaryOverlay = false;
  OverlayEntry _overlayEntry, _blurOverlayEntry;
  bool _lights = true;
  
  bool isShowingOverlay() => _overlayEntry != null;

  removeOverlay() {
    setState(() {
      createDiaryOverlay = false;
    });
   
    _overlayEntry.remove();
    _overlayEntry = null;
    
    _blurOverlayEntry.remove();
  }
  
  showOverlay(BuildContext context) {
    if (isShowingOverlay()) {
      removeOverlay();
    }
    
    setState(() {
      createDiaryOverlay = true;
    });
    
    OverlayState overlayState = Overlay.of(context);

    _blurOverlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
    );
    
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width,
        height: 0.4 * MediaQuery.of(context).size.height,
        bottom: 0.0,
        child: Card(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: FocusScope(
            node: _focusScopeNode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 40.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'How was your day, today?',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
                      ),
                      InkWell(
                        child: Icon(Icons.keyboard_arrow_down, color: Colors.black,),
                        onTap: () {
                          removeOverlay();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write anything, that you feel is worth mentioning.',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      autofocus: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.blue[50],
                          child: Text('Add Photo', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                          highlightColor: primaryColor,
                          textColor: primaryColor,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text('Special Memory', style: TextStyle(fontSize: 16.0, color: Colors.black),),
                            SizedBox(width: 5.0,),
                            CupertinoSwitch(
                              value: _lights,
                              activeColor: primaryColor,
                              onChanged: (bool value) { setState(() { _lights = value; }); },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () { setState(() { _lights = !_lights; }); },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      color: primaryColor,
                      child: Text('Continue', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      highlightColor: primaryColor,
                      textColor: Colors.white,
                      elevation: 0.0,
                      padding: const EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
    overlayState.insert(_blurOverlayEntry);
    overlayState.insert(_overlayEntry);
  }
  
  currentDayContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {
          print(formatDate(DateTime.now()));
          createDiaryOverlay == false ? showOverlay(context) : removeOverlay();
        },
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: primaryColor)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Today, Mar 28, 2019', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(height: 10.0,),
                    Text('How was your day, today?', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(Icons.keyboard_arrow_down, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusScopeNode.detach();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HomeScreenTopPart(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    currentDayContainer(context),
                    MemoriesCardsList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  labelColor: primaryColor,
                  indicatorColor: primaryColor,
                  unselectedLabelColor: Colors.black54,
                  tabs: <Widget>[
                    Tab(child: Text('My Diary', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),),
                    Tab(child: Text('Calendar', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),),
                    Tab(child: Text('Memories', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),),
                  ]
                ),
                SizedBox(width: 20.0,),
                settingsPopupMenu(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget settingsPopupMenu(BuildContext context) {
  return PopupMenuButton(
    padding: const EdgeInsets.all(8.0),
    icon: Icon(Icons.menu, color: Colors.black,),
    itemBuilder: (context) {
      var settingsList = List<PopupMenuEntry<Object>>();
      settingsList.add(
        PopupMenuItem(
          child: Text('Item 1', style: TextStyle(fontSize: 16.0, color: Colors.black),),
          value: 1,
        ),
      );
      settingsList.add(
        PopupMenuItem(
          child: Text('Item 2', style: TextStyle(fontSize: 16.0, color: Colors.black),),
          value: 2,
        ),
      );
      settingsList.add(
        PopupMenuItem(
          child: Text('Logout', style: TextStyle(fontSize: 16.0, color: Colors.black),),
          value: 3,
        ),
      );
      return settingsList;
    },
    initialValue: 1,
    onSelected: (value) {
      switch(value) {
        case 1:
          print('Item 1 clicked');
          break;
        case 2:
          print('Item 2 clicked');
          break;
        case 3:
          Navigator.pop(context);
          break;
      }
    },
  );
}

class MemoriesCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
      child: Column(
        children: tempCards,
      ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  final DateTime date;
  final String title, text, mood;
  final List<Image> images;
  
  MemoryCard(
    this.date,
    this.title,
    this.text,
    this.mood,
    this.images,
  );
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(top: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(formatDate(date), style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),),
            SizedBox(height: 10.0,),
            Text(title, style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 5.0,),
            Text(text, style: TextStyle(fontSize: 14.0, color: Colors.grey),),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.radio_button_checked, color: moodColors[mood], size: 16.0,),
                SizedBox(width: 5.0,),
                Text(mood, style: TextStyle(fontSize: 12.0, color: moodColors[mood]),),
              ],
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        side: BorderSide(color: Colors.black26),
      ),
    );
  }
}
