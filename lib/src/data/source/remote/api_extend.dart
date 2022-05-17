class ApiConfig {
  static const apiNewsBaseUrl = "https://newsapi.org/v2";
  static const apiNewsKey = "2a731ce5d9874d41a282962bc4bbb915";

  static const apiMovieBaseUrl = "https://api.themoviedb.org/3";
  static const apiMovieKey = "c95dbc5539526a49a7a86b0565ef53dc";

  static const apiGetImageBaseUrl = 'http://image.tmdb.org/t/p/w500';
}

class SpecialCode {
  static const int noSupportMethod = 1;
  static const int noNetwork = 2;
  static const int unauthorized = 401;

  // add more, ex: token fail, ...
}
