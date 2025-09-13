class AppConstants {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/";

  static const String messageEmptyList = "Список Пуст";

  static const String themeKey = "theme_setting";
}
// class AuthInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     try {
//       await getIt<AuthService>().ensureValidToken();
//
//       final token = await getIt<LocalStorage>().getToken();
//       if (token != null) {
//         options.headers['Authorization'] = 'Bearer ${token.access}';
//       }
//     } catch (e) {
//       return handler.reject(DioException(
//         requestOptions: options,
//         error: 'Auth error: $e',
//       ));
//     }
//
//     return handler.next(options);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     super.onError(err, handler);
//     if (err.response?.statusCode == 401 ) {
//       await getIt<AuthService>().forceLogin();
//     }
//   }
// }