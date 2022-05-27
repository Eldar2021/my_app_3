import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'view/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  final httpLink = HttpLink("https://demo.saleor.io/graphql/");

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: HiveStore()),
  ));

  runApp(
    GraphQLProvider(
      client: client,
      child: const App(),
    ),
  );
}
