import 'package:dio/dio.dart';
import 'package:ilink_task/core/apis/api.dart';
import 'package:ilink_task/core/utils/app_strings.dart';

class PetfinderApiClient {
  late Dio _dio;
  late String _accessToken;

  PetfinderApiClient() {
    _accessToken = '';
    _dio = Dio();
    _dio.options.baseUrl = Api.baseUrl;
    // 'https://api.petfinder.com/v2';
    _dio.options.headers[AppStrings.contentType] = AppStrings.applicationJson;

    // Add an interceptor for token refresh
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Authorization'] = 'Bearer $_accessToken';
        return handler.next(options);
      },
      onError: (DioError error, handler) async {
        if (error.response?.statusCode == 401) {
          // Token expired, refresh the token
          await _refreshToken(error.requestOptions);
        }
        return handler.reject(error);
      },
    ));
  }

  Future<void> _refreshToken(RequestOptions requestOptions) async {
    try {
      // Make a POST request to refresh the token
      Response response = await _dio.post(Api.tokenEndpiont, data: {
        'grant_type': 'client_credentials',
        'client_id': 'VgxSUOdnM2HXmIQtjBlm0kEb9ubogfyhCU2SASywXGNVVaIxHN',
        'client_secret': 'hyH0tMYJjEhaCU4puZDRtIgwvbtTewbtW10ECZCj',
      });

      // Extract the new access token
      _accessToken = response.data['access_token'];

      // Update the Authorization header in the original RequestOptions
      requestOptions.headers['Authorization'] = 'Bearer $_accessToken';
    } catch (e) {
      print('Error refreshing token: $e');
    }
  }

  Future<void> authenticate() async {
    try {
      // Make a POST request to authenticate and get the initial token
      Response response = await _dio.post(Api.tokenEndpiont, data: {
        'grant_type': 'client_credentials',
        'client_id': 'VgxSUOdnM2HXmIQtjBlm0kEb9ubogfyhCU2SASywXGNVVaIxHN',
        'client_secret': 'hyH0tMYJjEhaCU4puZDRtIgwvbtTewbtW10ECZCj',
      });

      // Extract the initial access token
      _accessToken = response.data['access_token'];
    } catch (e) {
      print('Error authenticating: $e');
      // Handle error or throw an exception if needed
    }
  }

  getAllAnimals(int page) async {
    if (_accessToken.isEmpty) {
      await authenticate();
    }

    try {
      return await _dio.get(
        Api.allAnimalsEndpoint,
        queryParameters: {'page': page},
      );
      // Process the response data
      // You can add further processing logic here if needed
    } catch (e) {
      print('Error fetching animals: $e');
      // Handle error if needed
    }
  }

  getAllTypes() async {
    if (_accessToken.isEmpty) {
      await authenticate();
    }

    try {
      return await _dio.get(Api.allTypesEndpiont);
      // Process the response data
      // You can add further processing logic here if needed
    } catch (e) {
      print('Error fetching animals: $e');
      // Handle error if needed
    }
  }
}
//  PetfinderApiClient client = PetfinderApiClient();
//   await client.fetchAnimals();