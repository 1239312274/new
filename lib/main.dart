import 'package:flutter/material.dart';
import 'listview.dart';

//import 'searchDelegate.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('物流查询'), centerTitle: true, elevation: 0, //阴影大小
              actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('开始搜索');
                }),
          ]),
      //  body: _grayCenter(context),
      body: ListViewDemo(),
      drawer: Drawer(
        child: ListView(
          //去上边栏灰色条
          padding: EdgeInsets.all(0),
          children: <Widget>[
            //固定格式的用户信息介绍
            UserAccountsDrawerHeader(
              //头像
              //美化控件
              decoration: BoxDecoration(
                  //背景图片
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3318041971,1744021610&fm=26&gp=0.jpg'))),
            ),
            //列表项
            ListTile(
              title: Text('顺风快递', textAlign: TextAlign.center),
              //左边图标
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text(
                '中通快递',
                textAlign: TextAlign.center,
              ),
              leading: Icon(
                Icons.favorite,
                color: Colors.orange,
              ),
            ),
            Divider(
              color: Colors.amberAccent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: 0 == 2 ? Colors.red : Colors.grey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add)]),
        onPressed: () {
          showAlertDialog(context);
        },
      ),

      /*  bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).accentColor,
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.home, color: Color(0xFFEEEEEE)),
                        Text("首页", style: TextStyle(color: Color(0xFFEEEEEE)))
                      ],
                    )),
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.forum, color: Color(0xFFEEEEEE)),
                        Text("论坛", style: TextStyle(color: Color(0xFFEEEEEE)))
                      ],
                    )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Color(0xFFEEEEEE),
                    ),
                    Text("发布", style: TextStyle(color: Color(0xFFEEEEEE)))
                  ],
                ),
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.mail, color: Color(0xFFEEEEEE)),
                        Text("消息", style: TextStyle(color: Color(0xFFEEEEEE)))
                      ],
                    )),
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.person, color: Color(0xFFEEEEEE)),
                        Text("我的", style: TextStyle(color: Color(0xFFEEEEEE)))
                      ],
                    ))
              ],
            ),
          ),
        )*/
    );
  }
}

showAlertDialog(BuildContext context) {
  //设置按钮
  Widget okButton = FlatButton(
    child: Text("确定"),
    onPressed: () {},
  );

  //设置对话框
  AlertDialog alert = AlertDialog(
    title: Text("提示"),
    content: Text("提交成功！"),
    actions: [
      // okButton,
    ],
  );

  //显示对话框
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
