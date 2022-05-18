import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../web_view.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebViewCubit(),
      child: const WebViewScreen(),
    );
  }
}
