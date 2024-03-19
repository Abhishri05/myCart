import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://imageio.forbes.com/i-forbesimg/media/lists/teams/real-madrid_416x416.jpg?format=jpg";

    return Drawer(
      child: Container(
        color: Colors.blueAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.white),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  "Abhishek Shrivastava",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: const Text(
                  "vegas@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Mail",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
