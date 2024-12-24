import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/webview.dart';



class CustomCard extends StatelessWidget {
  final Model model;
  const CustomCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Webview(url: model.url)));
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 7)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(model.img)),
                Text(model.title),
                const SizedBox(height: 10),
                Text(model.descrption),
                const SizedBox(height: 10),
                Text(model.author),
                Text(model.date),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
