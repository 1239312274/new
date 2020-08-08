import 'package:flutter/material.dart';
import 'datalist.dart';

class ListViewDemo extends StatelessWidget {
  Widget _cellForRow(BuildContext context, int index) {
    //自定义返回cell的函数
    //context：上下文
    //index：第几个widget（第几个cell）
    return Container(
        height: 360, //设置item的高度
        margin: EdgeInsets.only(left: 15, right: 15, top: 5), //设置item的边距
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 2), //设置边框的宽度 以及 颜色
          borderRadius: BorderRadius.all(Radius.circular(15)), //设置圆角
        ),
        child: Column(children: <Widget>[
          Text('送货单号：' + datas[index].no, textAlign: TextAlign.center),
          Expanded(
              child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      child: Column(children: <Widget>[
                    Text(''),
                    ListTile(
                      title: Text(datas[index].senderSite,
                          textAlign: TextAlign.left),
                      //  title: Text('广州', textAlign: TextAlign.left),
                      //左边图标
                      leading: Icon(
                        Icons.airport_shuttle,
                        color: Colors.red,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        datas[index].receiver,
                        textAlign: TextAlign.left,
                      ),
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.orange,
                      ),
                    ),
                  ])),
                ),
                Expanded(
                  child: Container(
                      child: Column(children: <Widget>[
                    Text(''),
                    ListTile(
                      title: Text('->', textAlign: TextAlign.center),
                    ),
                    ListTile(
                      title: Text(
                        '',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ])),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    child: Column(
                      children: <Widget>[
                        Text(''),
                        //列表项
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(datas[index].receiverSite,
                                      textAlign: TextAlign.center),
                                ),
                                ListTile(
                                  title: Text(
                                    datas[index].receiverSite,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Divider(
            color: Colors.amberAccent,
          ),
          Expanded(
            child: _grayCenter(context),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: datas.length, itemBuilder: _cellForRow);
  }

  int _counter = 0;
  List<String> dataList = ['快递已到达广州分拣中心', '正在派件', '派件成功'];
//物流详细
  Widget _grayCenter(BuildContext context) {
    List<Widget> widgets = [];
    for (String followupList in dataList) {
      Widget widget = _getRow(followupList);
      widgets.add(widget);
    }
    print(widgets);
    return Container(
      //width: double.infinity,
      height: 10,
      decoration: BoxDecoration(
        color: Color(0xFFF7F9FA),
        //  borderRadius: BorderRadius.circular(3),
        // border: Border.all(color: Colors.black54,width: 0),//设置边框的宽度 以及 颜色
        borderRadius: BorderRadius.all(Radius.circular(15)), //设置圆角
      ),
      //padding: EdgeInsets.only(left: 0, right: 15, top: 15, bottom: 15),
      alignment: Alignment.bottomLeft, //设置container的对其方式
      child: Column(
        children: widgets,
      ),
    );
  }

  Widget _getRow(String followupListItem) {
    String timestr = DateTime.now().toString().substring(0, 10);

    Widget firstRow;
    Widget contentWidget = SizedBox();
    //跟进记录
    contentWidget = Text(
      followupListItem ?? "--",
      style: TextStyle(
        fontSize: 12,
      ),
      softWrap: true,
    );

    firstRow = Row(
      children: <Widget>[
        Text(timestr,
            style: TextStyle(
              fontSize: 12.0,
            ))
      ],
    );

    Widget pointWidget;
    double topSpace = 0;
    topSpace = 3;
    pointWidget = ClipOval(
      child: Container(
        width: 7,
        height: 7,
        color: Colors.grey,
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //灰色右
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 37),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: topSpace == 0 ? 4 : 0,
                    ),
                    firstRow,
                    SizedBox(
                      height: 10.0,
                    ),
                    contentWidget,
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                width: 37,
                bottom: 0,
                top: topSpace,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      pointWidget,
                      Expanded(
                        child: Container(
                          width: 27,
                          /* child: MySeparatorVertical(
                            color: Colors.grey,
                          ),*/
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
