import 'package:book_reader/data/books_path.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


Future<List<String>> getPdfFilesInDownloadDirectory() async {
  List<String> pdfPaths = [];
  
  // Get the path to the device's download directory
  Directory? downloadDirectory = await getExternalStorageDirectory();

  if (downloadDirectory != null) {
    // List all files in the download directory
    List<FileSystemEntity> files = downloadDirectory.listSync();

    // Filter the list to include only PDF files
    for (var file in files) {
      if (file is File && file.path.toLowerCase().endsWith('.pdf')) {
        pdfPaths.add(file.path);
      }
    }
  }

  booksPath = pdfPaths;
  return pdfPaths;
}
