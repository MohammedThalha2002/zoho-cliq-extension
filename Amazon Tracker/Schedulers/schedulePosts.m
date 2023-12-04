
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
rows = List();
tracks = tracks.toList();

if(tracks.size() > 0 ){
	for each  track in tracks
	{
		row = Map();
		title = track.get("title");
		curr_price = track.get("curr_price");
		exp_price = track.get("exp_price");
		url = track.get("url");
		status = track.get("track_enabled");
		if(status == true){
			status = "enabled";
		} else {
			status = "disabled";
		}
		// 
		row.put("Title",title);
		row.put("Current Price","₹" + curr_price);
		row.put("Expected Price","₹" + exp_price);
		row.put("Track Status", status);
		row.put("Url","[link](" + url + ")");
		rows.add(row);
	}
	greetings = "! Good Morning🌞!\nReady to make today amazing😉? Don't forget to check out the latest deals waiting for you today.\nYour favorite items may be just a click away.";
	bot = Map();
	bot.put("name","Amazon Tracker");
	bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
	message = {"text":"Hey " + user.get("first_name") + greetings,"bot":bot,"slides":{{"type":"table","title":"","data":{"headers":{"Title","Current Price","Expected Price","Track Status","Url"},"rows":rows}}}};
	zoho.cliq.postToBot("amazontracker",message);
} else {
	message = {"text" : "No tracked products found! 😕\nIt seems like you haven't added any Amazon products to track yet. To get started, use the /newproduct command to add a product or visit the Amazon website to find items you'd like to monitor. 🛍️✨" };
	zoho.cliq.postToBot("amazontracker",message);
}
