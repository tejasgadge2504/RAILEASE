import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
  final List<String> blockedUsers;
  final Function(String) onUnblock;

  BlockedUsersPage({required this.blockedUsers, required this.onUnblock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked Users'),
      ),
      body: ListView.builder(
        itemCount: blockedUsers.length,
        itemBuilder: (context, index) {
          final blockedUser = blockedUsers[index];

          return ListTile(
            title: Text(blockedUser),
            trailing: ElevatedButton(
              onPressed: () {
                // Call the onUnblock callback to unblock the user
                onUnblock(blockedUser);
              },
              child: Text('Unblock'),
            ),
          );
        },
      ),
    );
  }
}
