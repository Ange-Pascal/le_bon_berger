class ApiRoutes {
  // Base Route dev
  // static String BASE_IP = '10.0.2.2';
  // static String APP_BASE_URL = 'http://$BASE_IP:8000/api';
  // static String CORE_BASE_URL = 'http://$BASE_IP:8000/api';

  // Base Route dev
  static String BASE_IP = 'https://leecka.bptechnology.net/public/index.php';
  static String APP_BASE_URL =
      'https://leecka.bptechnology.net/public/index.php/api';
  static String CORE_BASE_URL =
      'http://leecka.bptechnology.net/public/index.php/api';

  static String STORAGE_PUBLIC_PATH =
      'https://leecka.bptechnology.net/public/uploads/';

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

  // Absences
  static String absences = APP_BASE_URL + '/absences';
}
