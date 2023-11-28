
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
rows = List();
tracks = tracks.toList();
for each  track in tracks
{
	row = Map();
	curr_price = track.get("curr_price");
	if(curr_price == 0)
	{
		curr_price = "Updating...";
	}
	title = track.get("url").remove("https://www.amazon.in/");
	i = title.indexOf("/");
	title = title.subString(0,i);
	title = title.replaceAll("-", " ");
	row.put("Title",title);
	row.put("Current Price","₹" + curr_price);
	row.put("Expected Price","₹" + track.get("exp_price"));
	row.put("Url","[link](" + track.get("url") + ")");
	rows.add(row);
}
greetings = "! Good Morning🌞!\nReady to make today amazing😉? Don't forget to check out the latest deals waiting for you today.\nYour favorite items may be just a click away.";
bot = Map();
bot.put("name","Amazon Tracker");
bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
message = {"text":"Hey " + user.get("first_name") + greetings,"bot":bot,"slides":{{"type":"table","title":"","data":{"headers":{"Title","Current Price","Expected Price","Url"},"rows":rows}}}};
zoho.cliq.postToBot("amazontracker",message);
