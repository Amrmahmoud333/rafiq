import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rafiq/data/chach_helper.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);
  static const routeName = '/add_post';
  @override
  Widget build(BuildContext context) {
    double h(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double w(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    String avatar = CahchHelper.getData(key: 'avatar');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE8DEEB),
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0XFF5B618A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const AutoSizeText(
          'add post',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color(0XFF5B618A),
            fontFamily: 'DavidLibre',
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffDBD1EB),
              Color(0xffF7F4F8),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: h(24)),
            Row(
              children: [
                SizedBox(width: w(16)),
                Container(
                  width: w(50),
                  height: h(50),
                  decoration: BoxDecoration(
                    color: const Color(0xff5B618A),
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xffE8DEEB), width: 2),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(avatar),
                    ),
                  ),
                ),
                SizedBox(width: w(9)),
                AutoSizeText(
                  CahchHelper.getData(key: 'userName'),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0XFF5B618A),
                    fontFamily: 'DavidLibre',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h(400),
              width: w(370),
              //  color: Colors.amber,
              child: const TextField(
                expands: true,
                maxLines: null,
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF6E75A0),
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'add text...',
                  hintStyle:
                      TextStyle(fontSize: 25.0, color: Color(0xFF6E75A0)),
                ),
                /*String value = "";
                TextField(
                   onChanged: (text) {
                      value = text;
                          },
                        )*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
