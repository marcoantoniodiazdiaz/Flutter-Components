import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 10
            ),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.purple,
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://scontent.fmex4-2.fna.fbcdn.net/v/t1.0-9/54433601_2189200434507988_2772030235674148864_n.jpg?_nc_cat=111&_nc_ht=scontent.fmex4-2.fna&oh=a9de11b31a5f0a30a9447c1f2c0a66d1&oe=5D814095',
            ),
            radius: 28,
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
            'https://scontent.fmex4-2.fna.fbcdn.net/v/t1.0-9/54433601_2189200434507988_2772030235674148864_n.jpg?_nc_cat=111&_nc_ht=scontent.fmex4-2.fna&oh=a9de11b31a5f0a30a9447c1f2c0a66d1&oe=5D814095'
          ),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }
}