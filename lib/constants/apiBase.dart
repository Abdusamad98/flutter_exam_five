class ApiBase {
  static final ApiBase _instance = ApiBase.init();
  static ApiBase get instance => _instance;
  ApiBase.init();

  final String caregories = 'https://third-exam.free.mockoapp.net/categories';
  
}