class ApiRoutes {
  // Base Route
  static String BASE_IP = '10.213.42.7';
  static String APP_BASE_URL = 'http://$BASE_IP:50000';
  static String CORE_BASE_URL = 'http://$BASE_IP:50100';

  static String STORAGE_PUBLIC_PATH = APP_BASE_URL + '/public/uploads/';

  // APP ROUTE
  static String membres = APP_BASE_URL + '/membres';
  // Cellule Route
  static String cellules = APP_BASE_URL + '/cellules';

  // Maison Route
  static String maisons = APP_BASE_URL + '/maisons';

  // departement Route
  static String departements = APP_BASE_URL + '/departements';
}
