
response = Map();
formData = form.get("values");
id = formData.get("product_id");
exp_price = formData.get("exp_price");
url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/update-price/" + id + "/" + exp_price
	type :PUT
	connection:"amazontracker"
];
response = Map();
if(track.get("status") == "success")
{
	response.put("text","Your product updated successfully🔥");
	bot = Map();
	bot.put("name","Amazon Tracker");
	bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
	response.put("bot",bot);
	card = Map();
	card.put("title","SUCCESS🎉");
	response.put("card",card);
}
else
{
	response.put("text","Something went wrong😓" + track);
	bot = Map();
	bot.put("name","Amazon Tracker");
	bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
	response.put("bot",bot);
	card = Map();
	card.put("title","Failed🚩");
	response.put("card",card);
}
return response;
