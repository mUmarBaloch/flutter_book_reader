import 'package:flutter/material.dart';

import '../functionalities/get_books_path.dart';

class BookShelf extends StatelessWidget {
  const BookShelf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: getPdfFilesInDownloadDirectory(),builder: (context,snapshot)=>
      snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),):ListView(children: snapshot.data!.map((e) => Text(e)).toList()),
      ),
    );
  }
}