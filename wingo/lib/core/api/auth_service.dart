import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_constants.dart';

class AuthService {

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {

    final response = await http.post(
      Uri.parse(
        "${ApiConstants.baseUrl}/auth/login",
      ),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception("Login incorrecto");
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {

    final response = await http.post(
      Uri.parse(
        "${ApiConstants.baseUrl}/auth/register",
      ),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      }),
    );

    if (response.statusCode == 200 ||
        response.statusCode == 201) {

      return jsonDecode(response.body);
    }

    throw Exception("Error al registrar");
  }
}