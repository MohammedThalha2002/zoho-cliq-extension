
response = Map();
formData = form.get("values");
email = user.get("email");
url = formData.get("url");
price = formData.get("price");
if(url != null && price != null)
{
	params = Map();
	params.put("email",email);
	params.put("url",url);
	params.put("exp_price",price);
	url = "https://amazon-scraper-1etb.onrender.com";
	track = invokeurl
	[
		url :url + "/addtrack"
		type :POST
		parameters:params
		connection:"amazontracker"
	];
	if(track.get("status") == "success")
	{
		response.put("text","Your product track is enabled successfully🔥");
		bot = Map();
		bot.put("name","Amazon Tracker");
		bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
		response.put("bot",bot);
		card = Map();
		card.put("title","Congratulations🎉");
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
}
else
{
	response.put("text","Kindly enter Url and Price😓");
	bot = Map();
	bot.put("name","Amazon Tracker");
	bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
	response.put("bot",bot);
	card = Map();
	card.put("title","Failed🚩");
	response.put("card",card);
}
return response;
