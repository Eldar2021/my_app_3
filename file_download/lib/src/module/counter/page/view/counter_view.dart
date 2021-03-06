// import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/counter_cubit.dart';

const String _imageUrl =
    'https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 0;
  bool _isSelected = false;

  void _incrementCounter(bool val) {
    setState(() {
      _isSelected = !_isSelected;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 20,
                value: 0.1,
                backgroundColor: Colors.white,
                color: Colors.amber,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ChoiceChip(
              label: const Text('Click'),
              selected: _isSelected,
              onSelected: _incrementCounter,
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return IconButton(
                    onPressed: () async {
                       await context
                          .read<CounterCubit>()
                          .downloadFile(_imageUrl);
                      // print(path);
                      // EpubViewer.open(
                      //   path,
                      //   lastLocation: EpubLocator.fromJson({
                      //     "bookId": "2239",
                      //     "href": "/OEBPS/ch06.xhtml",
                      //     "created": 1539934158390,
                      //     "locations": {
                      //       "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                      //     }
                      //   }), // first page will open up if the value is null
                      // );
                    },
                    icon: const Icon(Icons.download_for_offline_outlined),
                  );
                } else if (state is CounterProgress) {
                  return SizedBox(
                    width: 200,
                    height: 200,
                    child: Stack(
                      children: [
                        Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            value: state.counter / 100,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Center(
                          child: Text(
                            ("${state.counter.toStringAsFixed(0)}%"),
                          ),
                        )
                      ],
                    ),
                  );
                  // return Text('${state.counter}/${state.total}');
                } else if (state is CounterSuccess) {
                  // OpenFile(state.file.path, true);
                  return Image.file(state.file);
                }
                return const Text('Bilbeim');
              },
            ),
          ],
        ),
      ),
    );
  }
}
