import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/utils.dart';

import '../../../../../common/views/my_app_bar.dart';

class AboutUsView extends StatelessWidget {
  static final String path = "lib/src/pages/blog/article1.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '关于我们',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/images/komisan.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("May 18, 2022"),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "您好，我是本APP的创作者，zed。请允许我说明几点。",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "本APP中，任何数据都是伪造的，您也没有必要在本APP中输入任何真实的个人信息。通常情况下，这个APP仅做展示所用，任何人或机构都不被允许私自使用。",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "关于本APP的权限说明。相机，以及访问相册权限，您可以不放行，但是您就无法修改您的头像了。缓存的读写权限，这是维持您登录状态，已经其他状态（如主题色）的主要手段，建议您放行。本APP承诺，不会收集您任何个人信息。",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "如果您对本APP有任何好的建议或批评，并且您想让我知晓，请在CSDN或Github中联系我，我会在下方留下网址。",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('GitHub：'),
                      TextButton(
                          onPressed: () {
                            launch('https://github.com/zedmyls');
                          },
                          child: Text(
                            'https://github.com/zedmyls',
                            style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('CSDN：'),
                      TextButton(
                          onPressed: () {
                            launch('https://blog.csdn.net/qq_44888570');
                          },
                          child: Text(
                            'https://blog.csdn.net/qq_44888570',
                            style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
