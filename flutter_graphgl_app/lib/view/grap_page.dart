import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GrapScreen extends StatelessWidget {
  const GrapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GrapScreen'),
      ),
      body: Query(
        options: QueryOptions(document: gql(doc1)),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          } else if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List? data = result.data?['products']?['edges'];
            return ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data?[index]["node"]["name"] ?? ''),
                    //leading: Text(data?[index]["node"]["thumbnail"] ?? ''),
                    leading: Image.network(data?[index]["node"]["thumbnail"]["url"] ?? ''),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

const doc1 = r"""{
  products(first: 5, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        thumbnail{
          url
        }
      }
    }
  }
}""";
