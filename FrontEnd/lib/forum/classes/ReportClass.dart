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
  static List<Report> getReports() {
    return <Report>[];
  }
}
