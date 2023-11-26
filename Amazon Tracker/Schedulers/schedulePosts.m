
url = "https://amazon-scraper-1etb.onrender.com";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
msg = "";
count = 1;
for each  track in tracks
{
	curr_price = track.get("curr_price");
	if(curr_price == 0)
	{
		curr_price = "Updating...";
	}
	title = track.get("url").remove("https://www.amazon.in/");
	i = title.indexOf("/");
	title = title.subString(0,i);
	msg = msg + count + ". " + title + "\n";
	msg = msg + "Expected price : ₹" + track.get("exp_price") + "\n";
	msg = msg + "Current price : ₹" + curr_price + "\n";
	msg = msg + "Product Link : [link](" + track.get("url") + ")\n\n";
	count = count + 1;
}
response = Map();
response.put("text",msg);
bot = Map();
bot.put("name","Amazon Tracker");
bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
response.put("bot",bot);
card = Map();
card.put("title","Your Products🎉");
response.put("card",card);
zoho.cliq.postToBot("amazontracker",response);
