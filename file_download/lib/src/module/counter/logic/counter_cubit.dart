import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  Future<String> downloadFile(String imageUrl) async {
    try {
      Dio dio = Dio();
      String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
      final String savePath = await getFilePath(fileName);
      await dio.download(
        imageUrl,
        savePath,
        onReceiveProgress: (rec, total) {
          // print(
          //     'received: ${rec.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');
          // if (total != -1) {
          //   print((rec / total * 100).toStringAsFixed(0) + "%");
          // }
          emit(
            CounterProgress(
              total.toDouble(),
              counter: rec / total * 100,
            ),
          );
        },
      );
      emit(CounterSuccess(File(savePath)));
      return savePath;
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = 'eldar';

    Directory? dir = await getApplicationDocumentsDirectory();
    // print(dir);

    path = '${dir.path}/$uniqueFileName';
    // print(path);

    return path;
  }
}
