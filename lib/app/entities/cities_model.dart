
// import 'dart:convert';

// Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

// String summaryToJson(Summary data) => json.encode(data.toJson());

// class Summary {
//     Summary({
//         this.data,
//     });

//     Data? data;

//     factory Summary.fromJson(Map<String, dynamic> json) => Summary(
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data!.toJson(),
//     };
// }

// class Data {
//     Data({
//         this.cities,
//     });

//     List<City>? cities;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
//     };
// }

// class City {
//     City({
//         this.id,
//         this.regionId,
//         this.slug,
//         this.name,
//         this.code,
//         this.latitude,
//         this.longitude,
//         this.location,
//         this.order,
//         this.active,
//         this.status,
//     });

//     int? id;
//     int? regionId;
//     String? slug;
//     String? name;
//     dynamic? code;
//     String? latitude;
//     String? longitude;
//     String? location;
//     int? order;
//     bool? active;
//     dynamic status;

//     City.fromJson(Map<String, dynamic> json) {
//         id: json["id"];
//         regionId: json["region_id"];
//         slug: json["slug"];
//         name: json["name"];
//         code: json["code"];
//         latitude: json["latitude"] == null ? null : json["latitude"];
//         longitude: json["longitude"] == null ? null : json["longitude"];
//         location: json["location"] == null ? null : json["location"];
//         order: json["order"];
//         active: json["active"];
//         status: json["status"];
//     }

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "region_id": regionId,
//         "slug": slug,
//         "name": name,
//         "code": code,
//         "latitude": latitude == null ? null : latitude,
//         "longitude": longitude == null ? null : longitude,
//         "location": location == null ? null : location,
//         "order": order,
//         "active": active,
//         "status": status,
//     };

//     static List<City> fromJsonList (List? data) {

//       if(data?.length == 0){
//         return [];
//       }
        
//       return data!.map((e) => City.fromJson(e)).toList();
//     }
// }
