
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
count = 1;
slidesArray = List();
tracks = tracks.get("docs").toList();
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
		curr_price = track.get("curr_price");
		exp_price = track.get("exp_price");
		url = track.get("url");
		// 
		slidesList1 = Map();
		slidesList1.put("type","label");
		slidesList1.put("title",count + ". " + title);
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
		action.put("type","invoke.function");
		data = Map();
		data.put("name","productInfo");
		action.put("data",data);
		buttonsList3.put("action",action);
		buttonsList3.put("key","more_key" + id);
		buttonsList.add(buttonsList3);
		slidesList1.put("buttons",buttonsList);
		dataList = list();
		dataList0 = Map();
		dataList0.put("💸Current Price","₹" + curr_price);
		dataList.add(dataList0);
		dataList1 = Map();
		dataList1.put("💵Expected Price","₹" + exp_price);
		dataList.add(dataList1);
		slidesList1.put("data",dataList);
		slidesList.add(slidesList1);
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
