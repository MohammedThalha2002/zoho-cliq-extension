
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
count = 1;
slidesArray = List();
tracks = tracks.toList();
response = Map();
bot = Map();
bot.put("name","Amazon Tracker");
bot.put("image","https://i.postimg.cc/KcKstCmd/logo.png");
response.put("bot",bot);
slidesList = list();
// 
if(tracks.size() > 0)
{
	for each  track in tracks
	{
		id = track.get("_id");
		title = track.get("title");
		imgUrl = track.get("imgUrl");
		inStock = track.get("inStock");
		if(inStock == true)
		{
			inStock = "IN STOCK";
		}
		else
		{
			inStock = "OUT OF STOCK";
		}
		curr_price = track.get("curr_price");
		exp_price = track.get("exp_price");
		rating = track.get("rating");
		stars = "";
		if(rating < 5)
		{
			stars = "⭐⭐⭐⭐⭐";
		}
		if(rating < 4)
		{
			stars = "⭐⭐⭐⭐";
		}
		if(rating < 3)
		{
			stars = "⭐⭐⭐";
		}
		if(rating < 2)
		{
			stars = "⭐⭐";
		}
		if(rating < 1)
		{
			stars = "⭐";
		}
		url = track.get("url");
		feature1 = track.get("features").get(0).toString();
		if(feature1.size() > 99)
		{
			feature1 = feature1.subString(0,95) + "...";
		}
		feature2 = track.get("features").get(1).toString();
		if(feature2.size() > 99)
		{
			feature2 = feature2.subString(0,95) + "...";
		}
		tracking = track.get("track_enabled");
		// 		
		slidesList0 = Map();
		slidesList0.put("type","images");
		slidesList0.put("title",count + ". " + title);
		dataList = list();
		dataList.add(imgUrl);
		slidesList0.put("data",dataList);
		slidesList.add(slidesList0);
		slidesList1 = Map();
		slidesList1.put("type","label");
		slidesList1.put("title",inStock);
		dataList = list();
		dataList0 = Map();
		dataList0.put("💸Current Price","₹" + curr_price);
		dataList.add(dataList0);
		dataList1 = Map();
		dataList1.put("💵Expected Price","₹" + exp_price);
		dataList.add(dataList1);
		slidesList1.put("data",dataList);
		slidesList.add(slidesList1);
		slidesList2 = Map();
		slidesList2.put("type","text");
		slidesList2.put("title","Rating : " + rating);
		slidesList2.put("data",stars);
		slidesList.add(slidesList2);
		slidesList3 = Map();
		slidesList3.put("type","list");
		slidesList3.put("title","Features");
		buttonsList = list();
		buttonsList0 = Map();
		buttonsList0.put("label","Url");
		action = Map();
		action.put("type","open.url");
		data = Map();
		data.put("web",url);
		action.put("data",data);
		buttonsList0.put("action",action);
		buttonsList.add(buttonsList0);
		buttonsList1 = Map();
		buttonsList1.put("label","Update");
		buttonsList1.put("type","+");
		action = Map();
		action.put("type","invoke.function");
		data = Map();
		data.put("name","updatePrice");
		action.put("data",data);
		buttonsList1.put("action",action);
		buttonsList1.put("key","update_key" + id);
		buttonsList.add(buttonsList1);
		buttonsList2 = Map();
		buttonsList2.put("label","Delete");
		buttonsList2.put("type","-");
		action = Map();
		action.put("type","invoke.function");
		data = Map();
		data.put("name","deleteProduct");
		action.put("data",data);
		buttonsList2.put("action",action);
		buttonsList2.put("key","delete_key" + id);
		buttonsList.add(buttonsList2);
		buttonsList3 = Map();
		buttonsList3.put("label","More..");
		action = Map();
		action.put("type","open.url");
		data = Map();
		data.put("web","https://amazon-product-view.vercel.app/" + id);
		action.put("data",data);
		buttonsList3.put("action",action);
		buttonsList.add(buttonsList3);
		slidesList3.put("buttons",buttonsList);
		dataList = list();
		dataList.add(feature1);
		dataList.add(feature2);
		slidesList3.put("data",dataList);
		slidesList.add(slidesList3);
		// 
		count = count + 1;
	}
	response.put("slides",slidesList);
	response.put("text","Your Products 📦");
	return response;
}
else
{
	msg = "No tracked products found! 😕\nIt seems like you haven't added any Amazon products to track yet. To get started, use the /newproduct command to add a product or visit the Amazon website to find items you'd like to monitor. 🛍️✨";
	return {"text":msg};
}
