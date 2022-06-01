library globals;

import 'package:homepage/forum/classes/PostClass.dart';

import 'classes/CommentClass.dart';

int nrPrefferencesMyPost = 0;
int nrPrefferencesHomePage = 0;
int nrPosts = 0;
int nrMyPosts = 0;
int nextIdComment = 0;
bool isChanged = false;
List<Post> posts = [];
List<Post> myPosts = [];
List<int> likedPosts = [];
bool isSearched = false;
String searchedH = "";
String searchedM = "";

bool isCreated = false;
bool isSorted = false;
bool checkedPopularM = false;
bool checkedCommentedM = false;
bool checkedRecentM = false;
bool checkedPopularH = false;
bool checkedCommentedH = false;
bool checkedRecentH = false;
