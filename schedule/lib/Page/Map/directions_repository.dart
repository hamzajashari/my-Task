import 'package:dio/dio.dart';
import 'package:bottomnavbar/Page/Map/.api.dart';
import 'package:bottomnavbar/Page/Map/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '.api.dart';
import 'directions_model.dart';
class DirectionsRepository {
  static const String _baseUrl =
      '0';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}