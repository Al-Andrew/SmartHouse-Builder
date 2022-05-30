library globals;

import 'package:homepage/forum/classes/PostClass.dart';

int nrPrefferencesMyPost = 0;
int nrPrefferencesHomePage = 0;

bool isChanged = false;
List<Post> posts = [];
List<Post> myPosts = [];

bool isSearched = false;
String searchedH = "";
String searchedM = "";

bool isSorted = false;
bool checkedPopularM = false;
bool checkedCommentedM = false;
bool checkedRecentM = false;
bool checkedPopularH = false;
bool checkedCommentedH = false;
bool checkedRecentH = false;
