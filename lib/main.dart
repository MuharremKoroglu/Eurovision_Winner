import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Eurovision());
}

class Eurovision extends StatelessWidget {
  const Eurovision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.cyan,
              Colors.black,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.cyan[800],
            title: Text(
              'EUROVISION WINNERS',
              style: GoogleFonts.redressed(
                color: Colors.yellow,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SafeArea(
            child: SongPage(),
          ),
        ),
      ),
    );
  }
}

class SongPage extends StatefulWidget {
  SongPage({Key? key}) : super(key: key);
  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  int pictureNo = 1;
  final player = AudioCache();
  List<String> songInfo = [
    'https://wiwibloggs.com/wp-content/uploads/2015/03/eurovision-2000-Denmark-winners-the-olsen-brothers.jpg',
    'https://static.eurovision.tv/hb-cgi/images/8da926c2-1ba9-4125-a4c9-58e07ee93295/hero.jpeg',
    'https://static.eurovision.tv/hb-cgi/images/8da923ea-db20-45e4-ab7d-4b09239d0f1b/hero.jpeg',
    'https://cdn1.ntv.com.tr/gorsel/sfLEUNCk_E25HuotzV5dTw.jpg?width=960&mode=crop&scale=both',
    'https://static.eurovision.tv/hb-cgi/images/8da92473-088f-4d94-80e4-f3e1a2cba66b/hero.png',
    'https://blog.konusarakogren.com/wp-content/uploads/2021/06/alexanderrybak_fairytale.jpg',
    'https://wiwibloggs.com/wp-content/uploads/2015/05/eurovision-winner-mans-zelmerlow-2015-heroes.jpg',
    'https://wiwibloggs.com/wp-content/uploads/2019/05/Duncan-Laurence-Arcade-Netherlands-Eurovision-2019-winner.jpg',
    'The Olsen Brothers',
    'Tanel Padar, Dave Benton & 2XL',
    'Marie N',
    'Sertab Erener',
    'Ruslana',
    'Alexander Rybak',
    'Måns Zelmerlöw',
    'Duncan Laurence',
    'Fly on the Wings of Love',
    'Everybody',
    'I Wanna',
    'Everyway That I Can',
    'Wild Dances',
    'Fairytale',
    'Heroes',
    'Arcade',
    'Denmark',
    'Esthonia ',
    'Latvia ',
    'Turkey ',
    'Ukraine',
    'Norway ',
    'Sweden ',
    'Holland',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2009',
    '2015',
    '2019',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  pictureNo = Random().nextInt(8);
                  player.play(
                    'music_$pictureNo.mp3',
                  );
                });
              },
              child: Image(
                image: NetworkImage(
                  songInfo[pictureNo],
                ),
              ),
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: ListTile(
              leading: Icon(
                Icons.perm_identity,
                color: Colors.black,
                size: 35.0,
              ),
              title: Text(
                songInfo[pictureNo + 8],
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: ListTile(
              leading: Icon(
                Icons.music_note,
                color: Colors.black,
                size: 35.0,
              ),
              title: Text(
                songInfo[pictureNo + 16],
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: ListTile(
              leading: Icon(
                Icons.public,
                color: Colors.black,
                size: 35.0,
              ),
              title: Text(
                songInfo[pictureNo + 24],
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 35.0,
              ),
              title: Text(
                songInfo[pictureNo + 32],
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
