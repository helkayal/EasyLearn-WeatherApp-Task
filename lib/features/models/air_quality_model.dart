class AirQualityModel {
  final double co;
  final double no2;
  final double o3;
  final double so2;
  final double pm25;
  final double pm10;
  final int usEpaIndex;
  final int gbDefraIndex;

  const AirQualityModel({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    return AirQualityModel(
      co: (json['co'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
      pm25: (json['pm2_5'] as num).toDouble(),
      pm10: (json['pm10'] as num).toDouble(),
      usEpaIndex: json['us-epa-index'],
      gbDefraIndex: json['gb-defra-index'],
    );
  }
}
