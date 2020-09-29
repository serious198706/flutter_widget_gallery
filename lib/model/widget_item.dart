class WidgetItem {
  final String title;
  final String desc;
  final String coverUrl;
  final String docUrl;


  WidgetItem({this.title, this.desc, this.coverUrl, this.docUrl});

  static WidgetItem fromJson(dynamic json) {
    return WidgetItem(
      title: json['name'],
      desc: json['desc'],
      coverUrl: json['img_url'],
      docUrl: json['doc_url']
    );
  }
}