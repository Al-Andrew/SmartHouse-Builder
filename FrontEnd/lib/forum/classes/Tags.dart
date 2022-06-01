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
    Tags tag = new Tags(
      id: 0,
      flagReview: (json["rewiewFlag"] != null) ? json["rewiewFlag"] : 0,
      flagQuestion: (json["questionFlag"] != null) ? json["questionFlag"] : 0,
      flagSetup: (json["setupFlag"] != null) ? json["setupFlag"] : 0,
      flagHard: (json["hardwareFlag"] != null) ? json["hardwareFlag"] : 0,
      flagSoft: (json["softwareFlag"] != null) ? json["softwareFlag"] : 0,
    );
    return tag;
  }

  get tags => null;

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
