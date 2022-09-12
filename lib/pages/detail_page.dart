import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, this.data}) : super(key: key);
  final String? data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('親ページからのparameter'),
            Text(widget.data.toString())
          ],
        ),
      ),
    );
  }
}
