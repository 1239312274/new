class datalist {
  const datalist({
    //构造函数
    this.sender,
    this.receiver,
    this.senderSite,
    this.receiverSite,
    this.no,
    this.detail,
  });

  final String sender;
  final String receiver;
  final String senderSite;
  final String receiverSite;
  final String no;
  final List<String> detail;
}

//数据源数组：
final List<datalist> datas = [
  datalist(
    sender: '张三',
    receiver: '李四',
    senderSite: '广州',
    receiverSite: '上海',
    no: '123456789',
  ),
  datalist(
    sender: '赵六',
    receiver: '王五',
    senderSite: '广州',
    receiverSite: '上海',
    no: '12345674567',
  ),
  datalist(
    sender: '孙悟空',
    receiver: '猪八戒',
    senderSite: '郑州',
    receiverSite: '上海',
    no: '12345678',
  ),
  datalist(
    sender: '张飞',
    receiver: '李四',
    senderSite: '广州',
    receiverSite: '上海',
    no: '12345674567',
  ),
  datalist(
    sender: '张三',
    receiver: '李四',
    senderSite: '广州',
    receiverSite: '上海',
    no: '1234567',
  ),
  datalist(
    sender: '张三',
    receiver: '李四',
    senderSite: '广州',
    receiverSite: '上海',
    no: '12345678234',
  ),
  datalist(
    sender: '张三',
    receiver: '李四',
    senderSite: '广州',
    receiverSite: '上海',
    no: '65432112345',
  ),
  datalist(
    sender: '张三',
    receiver: '李四',
    senderSite: '广州',
    receiverSite: '上海',
    no: '23455678',
  ),
];
