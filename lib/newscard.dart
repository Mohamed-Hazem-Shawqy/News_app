import 'package:flutter/material.dart';
import 'package:news_app/custom/card.dart';
import 'package:news_app/request/response.dart';


class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  String url='';
  int selectedIndex = 0;
  List category = [
    'general',
    'sports',
    'technology',
    'science',
    'health',
  ];

  Response response = Response();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.all_out_sharp), label: 'general'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.laptop), label: 'tech'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'science'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.health_and_safety), label: 'health'),
            ]),
        appBar: AppBar(
          title: const Text("News"),
        ),
        body: FutureBuilder(
          future: response.article(category[selectedIndex]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    
                    return CustomCard(model: snapshot.data![index]);
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text('ERROR....');
            } else {
              return const Text('No data....');
            }
          },
        ));
  }
}
