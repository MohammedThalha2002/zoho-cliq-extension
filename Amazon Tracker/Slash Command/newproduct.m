
response = Map();
email = user.get("email");
id = user.get("organization_id");
url = options.get("url");
price = options.get("price");
if(url != null && price != null)
{
	params = Map();
	params.put("email",email);
	params.put("url",url);
	params.put("exp_price",price);
	params.put("userId",id);
	url = "https://amazon-scraper-black.vercel.app";
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
		response.put("text","Something went wrong😓");
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
	form = {"type":"form","title":"Amazon Tracker","name":"track-input-form","hint":"Track the prices of your favorite Amazon products with our Price Tracker Form!","button_label":"Submit","inputs":{{"name":"url","label":"Product URL","placeholder":"https://","hint":"Enter the Amazon product URL you want to track","min_length":"0","max_length":"1000","mandatory":true,"type":"text","format":"url"},{"name":"price","label":"Expected price","placeholder":"1200","hint":"Set the price at which you'd like to be notified","min":"0","max":"1000000","mandatory":true,"type":"number"}},"action":{"type":"invoke.function","name":"posttrackform"}};
	return form;
}
return response;
