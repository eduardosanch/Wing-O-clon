import '../models/user_model.dart';
import 'api_constants.dart';
import 'api_service.dart';

class UserService {

  final ApiService _apiService = ApiService();

  Future<UserModel> getUser(int userId) async {

    final response = await _apiService.get(
      "${ApiConstants.baseUrl}/users/$userId",
    );

    return UserModel.fromJson(response);
  }
}