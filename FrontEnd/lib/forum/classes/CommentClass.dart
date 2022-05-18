class Comment {
  int id;
  int id_user;
  int id_post;
  String content;
  String author;
  String date;
  int nrLikes;

  Comment({
    required this.id,
    required this.id_user,
    required this.id_post,
    required this.content,
    required this.author,
    required this.date,
    required this.nrLikes,
  });

  static List<Comment> getComments() {
    return <Comment>[
      Comment(
          id: 1,
          id_user: 1,
          id_post: 1,
          content:
              "Amazon Alexa App is one of the best for the Alexa-enabled devices that let you set up and manage your Alexa experience as per your location. You can easily set up your smart home devices including smart lights. The voice-controlled device which is also known aspersonal assistant is called Alexa. Through Alexa App for echo, you can control your home and all other smart devices.",
          author: "Dan G.",
          date: "05/11/2022",
          nrLikes: 5),
      Comment(
          id: 2,
          id_user: 1,
          id_post: 1,
          content:
              "Perhaps Alexa is incredibly sensitive to traces of a foreign accent that’s otherwise undetectable, or maybe she doesn’t like Southerners, but she just doesn’t seem to understand me very well",
          author: "Cristian L.",
          date: "05/11/2022",
          nrLikes: 5),
      Comment(
          id: 3,
          id_user: 1,
          id_post: 1,
          content:
              "Buy her! Also you should follow each and every instruction carefully for Alexa App Setup. Its setup is now easy as it contains only three-step which is installation, signing in and connect.",
          author: "John H.",
          date: "05/11/2022",
          nrLikes: 5),
    ];
  }
}
