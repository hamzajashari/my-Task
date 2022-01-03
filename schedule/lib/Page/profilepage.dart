import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final profileHeight = 144;

  get top => coverHeight - profileHeight / 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            BuildTop(),
            BuildContent(),
            Social(),
          ],
        )
    );
  }

  Stack BuildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CoverImage(),
        Positioned(
          top: top,
          child: ProfileImage(),
        )
      ],
    );
  }

  Widget CoverImage() =>
      Container(
        color: Colors.grey,
        child: Image.network(
          'https://res.cloudinary.com/practicaldev/image/fetch/s--ZmPcIbAW--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dzone.com/storage/temp/12334613-971.jpg'
          ,
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget ProfileImage() =>
      CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
            'https://static-cdn.jtvnw.net/jtv_user_pictures/programming-profile_image-82029196c527ed90-300x300.png'),
      );

  Widget BuildContent() =>
      Column(
        children: const [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(top: 65),
            child: Text('Hamza Jashari',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
          ),
          Text('Flutter Developer', style: TextStyle(fontFamily: 'RobotoMono')),
        ],
      );

  Widget Social() =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {  },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network('https://image.similarpng.com/very-thumbnail/2021/01/Facebook-icon-design-on-transparent-background-PNG.png',width: 40,height: 40,),
                ),
              ),
              InkWell(
                onTap: () {  },

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/2048px-Octicons-mark-github.svg.png',width: 40,height: 40,),
                ),
              ),
              InkWell(
                onTap: () {  },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network('https://cdn.icon-icons.com/icons2/2428/PNG/512/linkedin_black_logo_icon_147114.png',width: 40,height: 40,),
                ),
              )
            ],
  ),
      );
}

