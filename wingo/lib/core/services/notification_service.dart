import '../models/notification_model.dart';
import '../api/api_constants.dart';
import '../api/api_service.dart';

class NotificationService {

  final ApiService _apiService =
      ApiService();

  Future<List<NotificationModel>>
      getNotifications() async {

    final response =
        await _apiService.get(
      "${ApiConstants.baseUrl}/notifications",
    );

    return (response as List)
        .map(
          (item) =>
              NotificationModel.fromJson(item),
        )
        .toList();
  }
}