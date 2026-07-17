class NotificationDataModel {
  NotificationDataModel.fromJson(Map<String, dynamic> json) {
    deviceToken = json['deviceToken'] as String?;
    deviceType = json['deviceType'] as String?;
    deviceId = json['deviceId'] as String?;
  }

  NotificationDataModel({this.deviceToken, this.deviceType, this.deviceId});
  String? deviceToken;
  String? deviceType;
  String? deviceId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceToken'] = deviceToken;
    data['deviceType'] = deviceType;
    data['deviceId'] = deviceId;
    return data;
  }
}
