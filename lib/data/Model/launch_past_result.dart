// To parse this JSON data, do
//
//     final launchPastResult = launchPastResultFromJson(jsonString);

import 'dart:convert';

LaunchPastResult launchPastResultFromJson(String str) =>
    LaunchPastResult.fromJson(json.decode(str));

String launchPastResultToJson(LaunchPastResult data) =>
    json.encode(data.toJson());

class LaunchPastResult {
  LaunchPastResult({
    this.result,
    this.data,
  });

  Result result;
  List<Datum> data;

  factory LaunchPastResult.fromJson(Map<String, dynamic> json) =>
      LaunchPastResult(
        result: Result.fromJson(json["result"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.details,
    this.id,
    this.isTentative,
    this.launchDateLocal,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchSite,
    this.launchSuccess,
    this.launchYear,
    this.links,
    this.missionId,
    this.missionName,
    this.rocket,
    this.staticFireDateUnix,
    this.staticFireDateUtc,
    this.telemetry,
    this.tentativeMaxPrecision,
    this.upcoming,
    this.ships,
  });

  String details;
  String id;
  bool isTentative;
  DateTime launchDateLocal;
  int launchDateUnix;
  DateTime launchDateUtc;
  LaunchSite launchSite;
  bool launchSuccess;
  String launchYear;
  Links links;
  List<String> missionId;
  String missionName;
  PurpleRocket rocket;
  int staticFireDateUnix;
  DateTime staticFireDateUtc;
  Telemetry telemetry;
  TentativeMaxPrecision tentativeMaxPrecision;
  bool upcoming;
  List<RocketElement> ships;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        details: json["details"] == null ? null : json["details"],
        id: json["id"],
        isTentative: json["is_tentative"],
        launchDateLocal: DateTime.parse(json["launch_date_local"]),
        launchDateUnix: json["launch_date_unix"],
        launchDateUtc: DateTime.parse(json["launch_date_utc"]),
        launchSite: LaunchSite.fromJson(json["launch_site"]),
        launchSuccess:
            json["launch_success"] == null ? null : json["launch_success"],
        launchYear: json["launch_year"],
        links: Links.fromJson(json["links"]),
        missionId: List<String>.from(json["mission_id"].map((x) => x)),
        missionName: json["mission_name"],
        rocket: PurpleRocket.fromJson(json["rocket"]),
        staticFireDateUnix: json["static_fire_date_unix"] == null
            ? null
            : json["static_fire_date_unix"],
        staticFireDateUtc: json["static_fire_date_utc"] == null
            ? null
            : DateTime.parse(json["static_fire_date_utc"]),
        telemetry: Telemetry.fromJson(json["telemetry"]),
        tentativeMaxPrecision:
            tentativeMaxPrecisionValues.map[json["tentative_max_precision"]],
        upcoming: json["upcoming"],
        ships: List<RocketElement>.from(json["ships"]
            .map((x) => x == null ? null : RocketElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "details": details == null ? null : details,
        "id": id,
        "is_tentative": isTentative,
        "launch_date_local": launchDateLocal.toIso8601String(),
        "launch_date_unix": launchDateUnix,
        "launch_date_utc": launchDateUtc.toIso8601String(),
        "launch_site": launchSite.toJson(),
        "launch_success": launchSuccess == null ? null : launchSuccess,
        "launch_year": launchYear,
        "links": links.toJson(),
        "mission_id": List<dynamic>.from(missionId.map((x) => x)),
        "mission_name": missionName,
        "rocket": rocket.toJson(),
        "static_fire_date_unix":
            staticFireDateUnix == null ? null : staticFireDateUnix,
        "static_fire_date_utc": staticFireDateUtc == null
            ? null
            : staticFireDateUtc.toIso8601String(),
        "telemetry": telemetry.toJson(),
        "tentative_max_precision":
            tentativeMaxPrecisionValues.reverse[tentativeMaxPrecision],
        "upcoming": upcoming,
        "ships":
            List<dynamic>.from(ships.map((x) => x == null ? null : x.toJson())),
      };
}

class LaunchSite {
  LaunchSite({
    this.siteId,
    this.siteNameLong,
    this.siteName,
  });

  SiteId siteId;
  SiteNameLong siteNameLong;
  SiteName siteName;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: siteIdValues.map[json["site_id"]],
        siteNameLong: siteNameLongValues.map[json["site_name_long"]],
        siteName: siteNameValues.map[json["site_name"]],
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteIdValues.reverse[siteId],
        "site_name_long": siteNameLongValues.reverse[siteNameLong],
        "site_name": siteNameValues.reverse[siteName],
      };
}

enum SiteId { CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A, KWAJALEIN_ATOLL }

final siteIdValues = EnumValues({
  "ccafs_slc_40": SiteId.CCAFS_SLC_40,
  "ksc_lc_39a": SiteId.KSC_LC_39_A,
  "kwajalein_atoll": SiteId.KWAJALEIN_ATOLL,
  "vafb_slc_4e": SiteId.VAFB_SLC_4_E
});

enum SiteName { CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A, KWAJALEIN_ATOLL }

final siteNameValues = EnumValues({
  "CCAFS SLC 40": SiteName.CCAFS_SLC_40,
  "KSC LC 39A": SiteName.KSC_LC_39_A,
  "Kwajalein Atoll": SiteName.KWAJALEIN_ATOLL,
  "VAFB SLC 4E": SiteName.VAFB_SLC_4_E
});

enum SiteNameLong {
  CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
  VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E,
  KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
  KWAJALEIN_ATOLL_OMELEK_ISLAND
}

final siteNameLongValues = EnumValues({
  "Cape Canaveral Air Force Station Space Launch Complex 40":
      SiteNameLong.CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
  "Kennedy Space Center Historic Launch Complex 39A":
      SiteNameLong.KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
  "Kwajalein Atoll Omelek Island": SiteNameLong.KWAJALEIN_ATOLL_OMELEK_ISLAND,
  "Vandenberg Air Force Base Space Launch Complex 4E":
      SiteNameLong.VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E
});

class Links {
  Links({
    this.articleLink,
    this.flickrImages,
    this.missionPatchSmall,
    this.missionPatch,
    this.presskit,
    this.redditCampaign,
    this.redditLaunch,
    this.redditMedia,
    this.redditRecovery,
    this.videoLink,
    this.wikipedia,
  });

  String articleLink;
  List<String> flickrImages;
  String missionPatchSmall;
  String missionPatch;
  String presskit;
  String redditCampaign;
  String redditLaunch;
  String redditMedia;
  String redditRecovery;
  String videoLink;
  String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        articleLink: json["article_link"] == null ? null : json["article_link"],
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        missionPatchSmall: json["mission_patch_small"] == null
            ? null
            : json["mission_patch_small"],
        missionPatch:
            json["mission_patch"] == null ? null : json["mission_patch"],
        presskit: json["presskit"] == null ? null : json["presskit"],
        redditCampaign:
            json["reddit_campaign"] == null ? null : json["reddit_campaign"],
        redditLaunch:
            json["reddit_launch"] == null ? null : json["reddit_launch"],
        redditMedia: json["reddit_media"] == null ? null : json["reddit_media"],
        redditRecovery:
            json["reddit_recovery"] == null ? null : json["reddit_recovery"],
        videoLink: json["video_link"],
        wikipedia: json["wikipedia"] == null ? null : json["wikipedia"],
      );

  Map<String, dynamic> toJson() => {
        "article_link": articleLink == null ? null : articleLink,
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "mission_patch_small":
            missionPatchSmall == null ? null : missionPatchSmall,
        "mission_patch": missionPatch == null ? null : missionPatch,
        "presskit": presskit == null ? null : presskit,
        "reddit_campaign": redditCampaign == null ? null : redditCampaign,
        "reddit_launch": redditLaunch == null ? null : redditLaunch,
        "reddit_media": redditMedia == null ? null : redditMedia,
        "reddit_recovery": redditRecovery == null ? null : redditRecovery,
        "video_link": videoLink,
        "wikipedia": wikipedia == null ? null : wikipedia,
      };
}

class PurpleRocket {
  PurpleRocket({
    this.fairings,
    this.firstStage,
    this.rocketName,
    this.rocketType,
    this.rocket,
    this.secondStage,
  });

  Fairings fairings;
  FirstStage firstStage;
  RocketName rocketName;
  RocketType rocketType;
  RocketElement rocket;
  SecondStage secondStage;

  factory PurpleRocket.fromJson(Map<String, dynamic> json) => PurpleRocket(
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
        firstStage: FirstStage.fromJson(json["first_stage"]),
        rocketName: rocketNameValues.map[json["rocket_name"]],
        rocketType: rocketTypeValues.map[json["rocket_type"]],
        rocket: RocketElement.fromJson(json["rocket"]),
        secondStage: SecondStage.fromJson(json["second_stage"]),
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings == null ? null : fairings.toJson(),
        "first_stage": firstStage.toJson(),
        "rocket_name": rocketNameValues.reverse[rocketName],
        "rocket_type": rocketTypeValues.reverse[rocketType],
        "rocket": rocket.toJson(),
        "second_stage": secondStage.toJson(),
      };
}

class Fairings {
  Fairings({
    this.recovered,
    this.recoveryAttempt,
    this.reused,
    this.ship,
  });

  bool recovered;
  bool recoveryAttempt;
  bool reused;
  Ship ship;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        recovered: json["recovered"] == null ? null : json["recovered"],
        recoveryAttempt:
            json["recovery_attempt"] == null ? null : json["recovery_attempt"],
        reused: json["reused"] == null ? null : json["reused"],
        ship: json["ship"] == null ? null : shipValues.map[json["ship"]],
      );

  Map<String, dynamic> toJson() => {
        "recovered": recovered == null ? null : recovered,
        "recovery_attempt": recoveryAttempt == null ? null : recoveryAttempt,
        "reused": reused == null ? null : reused,
        "ship": ship == null ? null : shipValues.reverse[ship],
      };
}

enum Ship { GOMSCHIEF, GOMSTREE, GOSEARCHER }

final shipValues = EnumValues({
  "GOMSCHIEF": Ship.GOMSCHIEF,
  "GOMSTREE": Ship.GOMSTREE,
  "GOSEARCHER": Ship.GOSEARCHER
});

class FirstStage {
  FirstStage({
    this.cores,
  });

  List<CoreElement> cores;

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: List<CoreElement>.from(
            json["cores"].map((x) => CoreElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
      };
}

class CoreElement {
  CoreElement({
    this.block,
    this.core,
    this.flight,
    this.gridfins,
    this.landSuccess,
    this.landingIntent,
    this.landingType,
    this.landingVehicle,
    this.legs,
    this.reused,
  });

  int block;
  CoreCore core;
  int flight;
  bool gridfins;
  bool landSuccess;
  bool landingIntent;
  LandingType landingType;
  LandingVehicle landingVehicle;
  bool legs;
  bool reused;

  factory CoreElement.fromJson(Map<String, dynamic> json) => CoreElement(
        block: json["block"] == null ? null : json["block"],
        core: CoreCore.fromJson(json["core"]),
        flight: json["flight"],
        gridfins: json["gridfins"],
        landSuccess: json["land_success"] == null ? null : json["land_success"],
        landingIntent: json["landing_intent"],
        landingType: json["landing_type"] == null
            ? null
            : landingTypeValues.map[json["landing_type"]],
        landingVehicle: json["landing_vehicle"] == null
            ? null
            : landingVehicleValues.map[json["landing_vehicle"]],
        legs: json["legs"],
        reused: json["reused"],
      );

  Map<String, dynamic> toJson() => {
        "block": block == null ? null : block,
        "core": core.toJson(),
        "flight": flight,
        "gridfins": gridfins,
        "land_success": landSuccess == null ? null : landSuccess,
        "landing_intent": landingIntent,
        "landing_type":
            landingType == null ? null : landingTypeValues.reverse[landingType],
        "landing_vehicle": landingVehicle == null
            ? null
            : landingVehicleValues.reverse[landingVehicle],
        "legs": legs,
        "reused": reused,
      };
}

class CoreCore {
  CoreCore({
    this.asdsAttempts,
    this.asdsLandings,
    this.block,
    this.id,
    this.missions,
    this.originalLaunch,
    this.reuseCount,
    this.rtlsAttempts,
    this.rtlsLandings,
    this.status,
    this.waterLanding,
  });

  int asdsAttempts;
  int asdsLandings;
  int block;
  String id;
  List<Mission> missions;
  DateTime originalLaunch;
  int reuseCount;
  int rtlsAttempts;
  int rtlsLandings;
  Status status;
  bool waterLanding;

  factory CoreCore.fromJson(Map<String, dynamic> json) => CoreCore(
        asdsAttempts: json["asds_attempts"],
        asdsLandings: json["asds_landings"],
        block: json["block"] == null ? null : json["block"],
        id: json["id"],
        missions: List<Mission>.from(
            json["missions"].map((x) => Mission.fromJson(x))),
        originalLaunch: DateTime.parse(json["original_launch"]),
        reuseCount: json["reuse_count"],
        rtlsAttempts: json["rtls_attempts"],
        rtlsLandings: json["rtls_landings"],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        waterLanding: json["water_landing"],
      );

  Map<String, dynamic> toJson() => {
        "asds_attempts": asdsAttempts,
        "asds_landings": asdsLandings,
        "block": block == null ? null : block,
        "id": id,
        "missions": List<dynamic>.from(missions.map((x) => x.toJson())),
        "original_launch": originalLaunch.toIso8601String(),
        "reuse_count": reuseCount,
        "rtls_attempts": rtlsAttempts,
        "rtls_landings": rtlsLandings,
        "status": status == null ? null : statusValues.reverse[status],
        "water_landing": waterLanding,
      };
}

class Mission {
  Mission({
    this.flight,
    this.name,
  });

  int flight;
  String name;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
        flight: json["flight"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "flight": flight,
        "name": name,
      };
}

enum Status { UNKNOWN, ACTIVE, LOST, INACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE,
  "inactive": Status.INACTIVE,
  "lost": Status.LOST,
  "unknown": Status.UNKNOWN
});

enum LandingType { ASDS, RTLS, OCEAN }

final landingTypeValues = EnumValues({
  "ASDS": LandingType.ASDS,
  "Ocean": LandingType.OCEAN,
  "RTLS": LandingType.RTLS
});

enum LandingVehicle { OCISLY, LZ_4, JRTI, LZ_1, LZ_2, JRTI_1 }

final landingVehicleValues = EnumValues({
  "JRTI": LandingVehicle.JRTI,
  "JRTI-1": LandingVehicle.JRTI_1,
  "LZ-1": LandingVehicle.LZ_1,
  "LZ-2": LandingVehicle.LZ_2,
  "LZ-4": LandingVehicle.LZ_4,
  "OCISLY": LandingVehicle.OCISLY
});

class RocketElement {
  RocketElement({
    this.id,
  });

  String id;

  factory RocketElement.fromJson(Map<String, dynamic> json) => RocketElement(
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
      };
}

enum RocketName { FALCON_9, FALCON_HEAVY, FALCON_1 }

final rocketNameValues = EnumValues({
  "Falcon 1": RocketName.FALCON_1,
  "Falcon 9": RocketName.FALCON_9,
  "Falcon Heavy": RocketName.FALCON_HEAVY
});

enum RocketType { FT, V1_1, V1_0, MERLIN_C, MERLIN_A }

final rocketTypeValues = EnumValues({
  "FT": RocketType.FT,
  "Merlin A": RocketType.MERLIN_A,
  "Merlin C": RocketType.MERLIN_C,
  "v1.0": RocketType.V1_0,
  "v1.1": RocketType.V1_1
});

class SecondStage {
  SecondStage({
    this.block,
    this.payloads,
  });

  int block;
  List<RocketElement> payloads;

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        block: json["block"] == null ? null : json["block"],
        payloads: List<RocketElement>.from(
            json["payloads"].map((x) => RocketElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "block": block == null ? null : block,
        "payloads": List<dynamic>.from(payloads.map((x) => x.toJson())),
      };
}

class Telemetry {
  Telemetry({
    this.flightClub,
  });

  String flightClub;

  factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        flightClub: json["flight_club"] == null ? null : json["flight_club"],
      );

  Map<String, dynamic> toJson() => {
        "flight_club": flightClub == null ? null : flightClub,
      };
}

enum TentativeMaxPrecision { HOUR }

final tentativeMaxPrecisionValues =
    EnumValues({"hour": TentativeMaxPrecision.HOUR});

class Result {
  Result({
    this.totalCount,
  });

  int totalCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
