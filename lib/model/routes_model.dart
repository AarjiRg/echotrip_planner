import 'dart:convert';

Rotesmodel rotesmodelFromJson(String str) => Rotesmodel.fromJson(json.decode(str));

String rotesmodelToJson(Rotesmodel data) => json.encode(data.toJson());

class Rotesmodel {
    List<Route>? routes;

    Rotesmodel({
        this.routes,
    });

    factory Rotesmodel.fromJson(Map<String, dynamic> json) => Rotesmodel(
        routes: json["routes"] == null ? [] : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "routes": routes == null ? [] : List<dynamic>.from(routes!.map((x) => x.toJson())),
    };
}

class Route {
    int? distanceMeters;
    String? duration;
    Polyline? polyline;
    List<Leg>? legs;

    Route({
        this.distanceMeters,
        this.duration,
        this.polyline,
        this.legs,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        distanceMeters: json["distanceMeters"],
        duration: json["duration"],
        polyline: json["polyline"] == null ? null : Polyline.fromJson(json["polyline"]),
        legs: json["legs"] == null ? [] : List<Leg>.from(json["legs"]!.map((x) => Leg.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "distanceMeters": distanceMeters,
        "duration": duration,
        "polyline": polyline?.toJson(),
        "legs": legs == null ? [] : List<dynamic>.from(legs!.map((x) => x.toJson())),
    };
}

class Leg {
    Polyline? polyline;

    Leg({
        this.polyline,
    });

    factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        polyline: json["polyline"] == null ? null : Polyline.fromJson(json["polyline"]),
    );

    Map<String, dynamic> toJson() => {
        "polyline": polyline?.toJson(),
    };
}

class Polyline {
    String? encodedPolyline;

    Polyline({
        this.encodedPolyline,
    });

    factory Polyline.fromJson(Map<String, dynamic> json) => Polyline(
        encodedPolyline: json["encodedPolyline"],
    );

    Map<String, dynamic> toJson() => {
        "encodedPolyline": encodedPolyline,
    };
}
