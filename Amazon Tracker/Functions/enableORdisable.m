
url = "https://amazon-scraper-black.vercel.app";
// enable or disable tracking of the product
key = arguments.get("key");
track = List();
if(key.contains("disable")){
// 	disable the track
	id = key.remove("disable");
	track = invokeurl
	[
		url :url + "/disable-tracking/" + id
		type :PUT
		connection:"amazontracker"
	];
	result = {"text":"Tracking Disabled successfully🎉","status":"success","type":"banner"};
	return result;
} else {
// 	enable the track
	id = key.remove("enable");
	track = invokeurl
	[
		url :url + "/enable-tracking/" + id
		type :PUT
		connection:"amazontracker"
	];
	result = {"text":"Tracking Enabled successfully🎉","status":"success","type":"banner"};
	return result;
}
