class ApiRoutes {
  // Base Route
  static String BASE_IP = '10.0.2.2';
  static String APP_BASE_URL = 'http://$BASE_IP:8000/api';
  static String CORE_BASE_URL = 'http://$BASE_IP:8000/api';

  static String STORAGE_PUBLIC_PATH = 'http://$BASE_IP:8000/uploads/';

  // APP ROUTE
  static String membres = APP_BASE_URL + '/membres';
  // Cellule Route
  static String cellules = APP_BASE_URL + '/cellules';

  // Maison Route
  static String maisons = APP_BASE_URL + '/maisons';

  // departement Route
  static String departements = APP_BASE_URL + '/departements';

  // Encadreur
  static String encadreur = APP_BASE_URL + '/encadreurs';
}
