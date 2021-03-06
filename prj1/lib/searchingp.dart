import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'show.dart';

class searching extends StatefulWidget {
  //const searching({Key? key}) : super(key: key);

  @override
  _searchingState createState() => _searchingState();
}

class _searchingState extends State<searching> {
  String showName;
  TextEditingController _controller = TextEditingController();
  List<Show> showFavList = [];
  Future<void> loadData() async {
    var url = 'https://api.tvmaze.com/search/shows?q=$showName';
    String genre;
    String score;
    String imgUrl;
    try {
      var resp = await get(Uri.parse(url));
      var data = jsonDecode(resp.body);
      imgUrl = data[0]['show']['image']['original'].toString();
      score = data[0]['show']['rating']['average'].toString();
      genre = data[0]['show']['genres'].toString();

      showFavList.add(
          Show(score: score, genre: genre, imageUrl: imgUrl, name: showName));
      setState(() {});
    } catch (e) {
      print('$e');
    }
  }

  Widget showTemplate(show) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(show.imageUrl),
            ),
            Column(
              children: [
                Text(
                  show.name,
                  style: TextStyle(),
                ),
                SizedBox(height: 5.0),
                Text(
                  show.genre,
                  style: TextStyle(),
                )
              ],
            ),
            SizedBox(width: 225.0),
            Text(show.score)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            loadData();
            _controller.clear();
          },
        ),
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Tv app show'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                onChanged: (name) {
                  showName = name;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Show name',
                ),
              ),
              Column(
                children: showFavList.map((e) => showTemplate(e)).toList(),
              )
            ],
          ),
        ));
  }
}
