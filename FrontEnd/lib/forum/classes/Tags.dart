class Tags {
  int id;
  int flagReview;
  int flagQuestion;
  int flagSetup;
  int flagHard;
  int flagSoft;

  Tags({
    required this.id,
    required this.flagReview,
    required this.flagQuestion,
    required this.flagSetup,
    required this.flagHard,
    required this.flagSoft,
  });

  factory Tags.fromJson(dynamic json) {
    return Tags(
      id: json["id"],
      flagReview: json["setupFlag"],
      flagQuestion: json["hardwareFlag"],
      flagSetup: json["softwareFlag"],
      flagHard: json["reviewFlag"],
      flagSoft: json["questionFlag"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'reviewFlag': flagReview,
        'questionFlag': flagQuestion,
        'setupFlag': flagSetup,
        'hardwareFlag': flagHard,
        'softwareFlag': flagSoft,
      };

  // @override
  // String toString(){

  // };
}
