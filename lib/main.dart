import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black87,
      systemNavigationBarColor: Colors.black87));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: <Widget>[
              _appbar(),
              _stories(context),
              Expanded(
                flex: 1,
                child: _chats(),
              ),
              _bottombar()
            ],
          ),
        ),
      ),
    );
  }

  Container _appbar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    user_profile_pic_url,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            'Chats',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 150,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _stories(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 0,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 60,
                child: Text(
                  'Your Story',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          _storyIcon(
              link: user[1]['link'],
              name: user[1]['name'],
              isActive: user[1]['isActive'],
              hasStatus: user[1]['hasStatus']),
          SizedBox(
            width: 20,
          ),
          _storyIcon(
              link: user[2]['link'],
              name: user[2]['name'],
              isActive: user[2]['isActive'],
              hasStatus: user[2]['hasStatus']),
          SizedBox(
            width: 20,
          ),
          _storyIcon(
              link: user[3]['link'],
              name: user[3]['name'],
              isActive: user[3]['isActive'],
              hasStatus: user[3]['hasStatus']),
          SizedBox(
            width: 20,
          ),
          _storyIcon(
              link: user[4]['link'],
              name: user[4]['name'],
              isActive: user[4]['isActive'],
              hasStatus: user[4]['hasStatus']),
          SizedBox(
            width: 20,
          ),
          _storyIcon(
              link: user[5]['link'],
              name: user[5]['name'],
              isActive: user[5]['isActive'],
              hasStatus: user[5]['hasStatus']),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Column _storyIcon(
      {@required String link,
      @required String name,
      @required int isActive,
      @required int hasStatus}) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasStatus == 0
                      ? Colors.transparent
                      : Colors.lightBlueAccent,
                  width: 3,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(link), fit: BoxFit.cover),
              ),
            ),
            Align(
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color:
                      isActive == 0 ? Colors.transparent : Colors.greenAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 60,
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Container _chats() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _chatRow(
                link: user[3]['link'],
                name: user[3]['name'],
                hasStatus: user[3]['hasStatus'],
                isActive: user[3]['isActive'],
                time: user[3]['time'],
                message: user[3]['message'],
                newMessage: user[3]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[1]['link'],
                name: user[1]['name'],
                hasStatus: user[1]['hasStatus'],
                isActive: user[1]['isActive'],
                time: user[1]['time'],
                message: user[1]['message'],
                newMessage: user[1]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[4]['link'],
                name: user[4]['name'],
                hasStatus: user[4]['hasStatus'],
                isActive: user[4]['isActive'],
                time: user[4]['time'],
                message: user[4]['message'],
                newMessage: user[4]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[3]['link'],
                name: user[3]['name'],
                hasStatus: user[3]['hasStatus'],
                isActive: user[3]['isActive'],
                time: user[3]['time'],
                message: user[3]['message'],
                newMessage: user[3]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[1]['link'],
                name: user[1]['name'],
                hasStatus: user[1]['hasStatus'],
                isActive: user[1]['isActive'],
                time: user[1]['time'],
                message: user[1]['message'],
                newMessage: user[1]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[4]['link'],
                name: user[4]['name'],
                hasStatus: user[4]['hasStatus'],
                isActive: user[4]['isActive'],
                time: user[4]['time'],
                message: user[4]['message'],
                newMessage: user[4]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[3]['link'],
                name: user[3]['name'],
                hasStatus: user[3]['hasStatus'],
                isActive: user[3]['isActive'],
                time: user[3]['time'],
                message: user[3]['message'],
                newMessage: user[3]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[1]['link'],
                name: user[1]['name'],
                hasStatus: user[1]['hasStatus'],
                isActive: user[1]['isActive'],
                time: user[1]['time'],
                message: user[1]['message'],
                newMessage: user[1]['newMessage']),
            SizedBox(
              height: 15,
            ),
            _chatRow(
                link: user[4]['link'],
                name: user[4]['name'],
                hasStatus: user[4]['hasStatus'],
                isActive: user[4]['isActive'],
                time: user[4]['time'],
                message: user[4]['message'],
                newMessage: user[4]['newMessage']),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Row _chatRow(
      {@required String link,
      @required String name,
      @required int isActive,
      @required int hasStatus,
      @required String message,
      @required String time,
      @required int newMessage}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasStatus == 1
                      ? Colors.lightBlueAccent
                      : Colors.transparent,
                  width: 3,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(link), fit: BoxFit.cover),
              ),
            ),
            Align(
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color:
                      isActive == 1 ? Colors.greenAccent : Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: newMessage == 1
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      time,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              message,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:
                      newMessage == 1 ? FontWeight.bold : FontWeight.normal),
            )
          ],
        )
      ],
    );
  }

  Container _bottombar() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            Icons.video_call,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Icon(
            Icons.people,
            color: Colors.white,
          )
        ],
      ),
    );
  }

/*
  Container _searchbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
*/

}
