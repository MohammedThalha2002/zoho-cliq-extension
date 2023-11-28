
response = Map();
formValues = form.get("values");

id = formValues.get("select").get("value");
title = formValues.get("select").get("label");

url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/delete/" + id
	type :DELETE
	connection:"amazontracker"
];
response = Map();
if(track.get("status") == "success")
{
	response.put("text", title + " deleted successfully🔥");
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
