
response = Map();
formValues = form.get("values");
id = formValues.get("products").get("value");
title = formValues.get("products").get("label");
exp_price = formValues.get("expected-price");

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
	response.put("text", title + "'s price updated successfully🔥");
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
