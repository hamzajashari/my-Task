import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Center(child: Text('Map', style: GoogleFonts.inter(fontSize: 60,fontWeight: FontWeight.w500))),
    );
  }
}
