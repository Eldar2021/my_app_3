import 'dart:io';
import 'dart:typed_data';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:epub_parser/epub_parser.dart' as epub;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as image;
import 'package:path_provider/path_provider.dart';

class EpubWidget extends StatefulWidget {
  const EpubWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EpubState();
}

class EpubState extends State<EpubWidget> {
  Future<epub.EpubBookRef>? book;

  final _urlController = TextEditingController();

  void fetchBookButton() {
    setState(() {
      book = fetchBook(_urlController.text);
    });
  }

  void fetchBookPresets(String link) {
    setState(() {
      book = fetchBook(link);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Epub Inspector',
                  style: TextStyle(fontSize: 25.0),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Enter the Url of an Epub to view some of it\'s metadata.',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Url",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Url cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: _urlController,
                  keyboardType: TextInputType.url,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                ElevatedButton(
                  onPressed: fetchBookButton,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(8.0),
                    ),
                    textStyle:
                        MaterialStateProperty.all<TextStyle>(const TextStyle(
                      color: Colors.white,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text("Inspect Book"),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Or select available links:',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Column(
                  children: [
                    ...[
                      'https://filesamples.com/samples/ebook/epub/Around%20the%20World%20in%2028%20Languages.epub',
                      'https://filesamples.com/samples/ebook/epub/Sway.epub',
                      'https://filesamples.com/samples/ebook/epub/Alices%20Adventures%20in%20Wonderland.epub',
                      'https://filesamples.com/samples/ebook/epub/sample1.epub',
                    ]
                        .map((link) => InkWell(
                              child: Text(link),
                              onTap: () => fetchBookPresets(link),
                            ))
                        .cast<Widget>()
                        .toList(),
                  ],
                ),
                const SizedBox(height: 25),
                Center(
                  child: FutureBuilder<epub.EpubBookRef>(
                    future: book,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Material(
                          color: Colors.white,
                          child: buildEpubWidget(snapshot.data!),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default, show a loading spinner
                      // return CircularProgressIndicator();

                      // By default, show just empty.
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildEpubWidget(epub.EpubBookRef book) {
  var chapters = book.getChapters();
  var cover = book.readCover();
  return Column(
    children: <Widget>[
      const Text(
        "Title",
        style: TextStyle(fontSize: 20.0),
      ),
      Text(
        book.Title!,
        style: const TextStyle(fontSize: 15.0),
      ),
      const SizedBox(height: 15),
      const Text(
        "Author",
        style: TextStyle(fontSize: 20.0),
      ),
      Text(
        book.Author!,
        style: const TextStyle(fontSize: 15.0),
      ),
      const SizedBox(height: 15),
      FutureBuilder<List<epub.EpubChapterRef>>(
        future: chapters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                const Text("Chapters", style: TextStyle(fontSize: 20.0)),
                Text(
                  snapshot.data!.length.toString(),
                  style: const TextStyle(fontSize: 15.0),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container();
        },
      ),
      const SizedBox(height: 15),
      FutureBuilder<epub.Image?>(
        future: cover,
        builder: (context, AsyncSnapshot<epub.Image?> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                const Text("Cover", style: TextStyle(fontSize: 20.0)),
                Image.memory(
                    Uint8List.fromList(image.encodePng(snapshot.data!))),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container();
        },
      ),
      ElevatedButton(
        onPressed: () async {
          final path = await getFilePath('${book.Title ?? 'samplebool'}.epub');
          // print(path);
          EpubViewer.open(
            path,
            // lastLocation: EpubLocator.fromJson({
            //   "bookId": "2239",
            //   "href": "/OEBPS/ch06.xhtml",
            //   "created": 1539934158390,
            //   "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
            // }), // first page will open up if the value is null
          );
        },
        child: const Text('Read'),
      ),
    ],
  );
}

// Needs a url to a valid url to an epub such as
// https://www.gutenberg.org/ebooks/11.epub.images
// or
// https://www.gutenberg.org/ebooks/19002.epub.images
Future<epub.EpubBookRef> fetchBook(String url) async {
  // Hard coded to Alice Adventures In Wonderland in Project Gutenberb
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the EPUB
    // final book = epub.EpubReader.readBook(response.bodyBytes);
    final epub.EpubBookRef book = await epub.EpubReader.openBook(
      response.bodyBytes,
    );

    saveFile('${book.Title ?? 'samplebool'}.epub');
    return book;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load epub');
  }
}

Future<String> getFilePath(String name) async {
  final appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path; // 2
  String filePath = '$appDocumentsPath/$name'; // 3

  return filePath;
}

void saveFile(String name) async {
  File file = File(await getFilePath(name)); // 1
  file.writeAsString(
    "This is my demo text that will be saved to : demoTextFile.txt",
  ); // 2
}

void readFile(String name) async {
  File file = File(await getFilePath(name)); // 1
  String fileContent = await file.readAsString(); // 2

  debugPrint('File Content: $fileContent');
}
