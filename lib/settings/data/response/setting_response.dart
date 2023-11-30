class SettingResponse {
  SettingResponse({
    required this.result,
  });

  final SettingResult result;

  factory SettingResponse.fromJson(Map<String, dynamic> json) {
    return SettingResponse(
      result: SettingResult.fromJson(json["result"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
      };
}

class SettingResult {
  SettingResult({
    required this.totalCount,
    required this.items,
  });

  final num totalCount;
  final List<Setting> items;

  factory SettingResult.fromJson(Map<String, dynamic> json) {
    return SettingResult(
      totalCount: json["totalCount"] ?? 0,
      items: json["items"] == null
          ? [Setting.fromJson({})]
          : List<Setting>.from(json["items"]!.map((x) => Setting.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class Setting {
  Setting({
    required this.mainClientAppVersion,
    required this.mainSriverAppVersion,
    required this.iosDomainTest,
    required this.mainClientAppVersionIos,
    required this.mainSriverAppVersionIos,
    required this.driverAppAndroidLink,
    required this.driverAppIosLink,
    required this.clientAppAndroidLink,
    required this.clientAppIosLink,
    required this.qareebCompanyId,
    required this.id,
  });

  final String mainClientAppVersion;
  final String mainSriverAppVersion;
  final String mainClientAppVersionIos;
  final String mainSriverAppVersionIos;
  final String driverAppAndroidLink;
  final String driverAppIosLink;
  final String clientAppAndroidLink;
  final String clientAppIosLink;
  final int qareebCompanyId;
  final bool iosDomainTest;
  final int id;

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      mainClientAppVersion: json["mainClientAppVersion"] ?? "",
      mainSriverAppVersion: json["mainSriverAppVersion"] ?? "",
      mainClientAppVersionIos: json["mainClientAppVersionIos"] ?? "",
      mainSriverAppVersionIos: json["mainSriverAppVersionIos"] ?? "",
      driverAppAndroidLink: json["driverAppAndroidLink"] ?? "",
      driverAppIosLink: json["driverAppIosLink"] ?? "",
      clientAppAndroidLink: json["clientAppAndroidLink"] ??
          'https://play.google.com/store/apps/details?id=com.firstPioneers.qareeb',
      clientAppIosLink: json["clientAppIosLink"] ??
          "https://apps.apple.com/us/app/qareeb-maas/id1627942221",
      iosDomainTest: json["iosDomainTest"] ?? true,
      qareebCompanyId: json["qareebCompanyId"] ?? 0,
      id: json["id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "mainClientAppVersion": mainClientAppVersion,
        "mainSriverAppVersion": mainSriverAppVersion,
        "iosDomainTest": iosDomainTest,
        "mainClientAppVersionIos": mainClientAppVersionIos,
        "mainSriverAppVersionIos": mainSriverAppVersionIos,
        "driverAppAndroidLink": driverAppAndroidLink,
        "driverAppIosLink": driverAppIosLink,
        "clientAppAndroidLink": clientAppAndroidLink,
        "clientAppIosLink": clientAppIosLink,
        "qareebCompanyId": qareebCompanyId,
        "id": id,
      };
}
