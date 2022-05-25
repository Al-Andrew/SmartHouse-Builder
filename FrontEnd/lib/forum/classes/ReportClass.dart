import 'package:http/http.dart' as http;
import 'dart:convert';

class Report {
  int id;
  int id_post;
  int id_author;
  String title;
  String motivation;
  String date;

  Report({
    required this.id,
    required this.id_post,
    required this.id_author,
    required this.title,
    required this.motivation,
    required this.date,
  });
  factory Report.fromJson(dynamic json) {
    return Report(
      id: json["id"],
      id_post: json["id_post"],
      id_author: json["id_author"],
      date: json["date"],
      title: json["title"],
      motivation: json["motivation"],
    );
  }
  dynamic toJson() => {
        'id': id,
        'id_author': id_author,
        'id_post': id_post,
        'title': title,
        'motivation': motivation,
        'date': date,
      };

  static Future<List<Report>> getReports() async {
    final response = await http.get(
        Uri.parse(
          'https://smart-house-builder.azurewebsites.net/api/forum',
        ),
        headers: {"Access-Control-Allow-Origin": "*"});
    List<Report> reports = [];

    var jsonData = json.decode(response.body);
    for (var v in jsonData) {
      print(v);
      print('Spatiu');
      reports.add(Report.fromJson(v));
    }

    return reports;
  }

  static List<Report> getLocalReports() {
    return <Report>[];
  }
}
