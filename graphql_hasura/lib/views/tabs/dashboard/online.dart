import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../data/online_fetch_data.dart';
import '../../../data/online_list.dart';

class Online extends StatelessWidget {
  const Online({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Online Users",
            style: TextStyle(fontSize: 28),
          ),
        ),
        Expanded(
          child: Subscription(
            options: SubscriptionOptions(
              document: gql(OnlineFetch.fetchUsers),
            ),
            builder: (res) {
              print(res);
              if (res.hasException) {
                return Text(res.exception.toString());
              } else if (res.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: (res.data!['online_users'] as List).length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(onlineList.list[index]),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
