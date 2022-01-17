class AppUrl {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  static const listUrl = '$_baseUrl/posts';

  static String detailUrl (var id){
    return '$listUrl/$id';
  }
}