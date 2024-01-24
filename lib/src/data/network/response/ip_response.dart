import 'package:json_annotation/json_annotation.dart';

part 'ip_response.g.dart';

@JsonSerializable()
class IpResponse {
	String? status;
	String? country;
	String? countryCode;
	String? region;
	String? regionName;
	String? city;
	String? zip;
	double? lat;
	double? lon;
	String? timezone;
	String? isp;
	String? org;
	String? as;
	String? query;

	IpResponse({
		this.status, 
		this.country, 
		this.countryCode, 
		this.region, 
		this.regionName, 
		this.city, 
		this.zip, 
		this.lat, 
		this.lon, 
		this.timezone, 
		this.isp, 
		this.org, 
		this.as, 
		this.query, 
	});

	factory IpResponse.fromJson(Map<String, dynamic> json) {
		return _$IpResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$IpResponseToJson(this);
}
