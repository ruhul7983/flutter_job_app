import 'package:flutter/material.dart';

class UserViewListTile extends StatelessWidget {
  final snap;
  const UserViewListTile({Key? key,  required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(snap['name']),
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            snap['image']
          ),
        ),
        subtitle: Text(snap['location']),
      ),
    );
  }
}
