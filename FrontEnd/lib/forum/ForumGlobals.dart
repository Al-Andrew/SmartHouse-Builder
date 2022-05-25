library globals;

import 'package:homepage/forum/classes/PostClass.dart';

int nrPrefferencesMyPost = 0;
int nrPrefferencesHomePage = 0;

bool isChanged = false;
List<Post> posts = [];
List<Post> myPosts = [];
List<Post> sortedPosts = [];
List<Post> sortedMyPosts = [];

bool isSearched = false;

bool isSorted = false;
bool checkedPopularM = false;
bool checkedCommentedM = false;
bool checkedRecentM = false;
bool checkedPopularH = false;
bool checkedCommentedH = false;
bool checkedRecentH = false;
