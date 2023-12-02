sections = list();
tabsArr = {{"label":"My Products","id":"myproducts"}};
elements = list();
url = "https://amazon-scraper-black.vercel.app";

// enable or disable tracking of the product
key = target.get("id");
if(key.contains("disable")){
// 	disable the track
	id = key.remove("disable");
	track = invokeurl
	[
		url :url + "/disable-tracking/" + id
		type :PUT
		connection:"amazontracker"
	];
} else {
// 	enable the track
	id = key.remove("enable");
	track = invokeurl
	[
		url :url + "/enable-tracking/" + id
		type :PUT
		connection:"amazontracker"
	];
}

tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
tracks = tracks.toList();
if(tracks.size() > 0)
{
	count = 1;
	for each  track in tracks
	{
		elements.add({"type":"title","text":count + ". " + track.get("title")});
		id = track.get("_id");
		curr_price = track.get("curr_price");
		exp_price = track.get("exp_price");
		features = track.get("features").get(0);
		tracking = track.get("track_enabled");
		// text & subtext
		elements.add({"type":"subtext","text":"📦" + features});
		elements.add({"type":"text","text":"*💸Curr Price* : ₹" + curr_price + "\n*💵Exp Price* : ₹" + exp_price});
		// buttons
		buttons = List();
		buttons.add({"label":"Update","type":"invoke.function","name":"WIDGETupdatePrice","id":"update" + id,"emotion":"positive"});
		buttons.add({"label":"Delete","type":"invoke.function","name":"WIDGETdeleteProduct","id":"delete" + id,"emotion":"negative"});
		buttons.add({"label":"More...","type":"invoke.function","name":"WIDGETshowWeb","id":"more" + id,"emotion":"neutral"});
		if(tracking == true){
			buttons.add({"label":"Disable","type":"invoke.function","name":"WIDGETenableORdiableTracking","id":"disable" + id, "emotion":"negative"});
		} else {
			buttons.add({"label":"Enable","type":"invoke.function","name":"WIDGETenableORdiableTracking","id":"enable" + id, "emotion":"positive"});
		}
		// 		
		elements.add({"type":"buttons","buttons": buttons });
		//
		elements.add({"type":"divider"});
		count = count + 1;
	}
}
else
{
	elements.add({"type":"text","text":"No tracked products found! 😕\nIt seems like you haven't added any Amazon products to track yet. To get started, use the /newproduct command to add a product or visit the Amazon website to find items you'd like to monitor. 🛍️✨"});
}
header = {"title":"My Products","buttons":{{"label":"Add Product","type":"invoke.function","name":"WIDGETaddProduct","id":"section","emotion":"positive"}}};
sections = list();
sections.add({"id":1,"elements":elements});
return {"type":"applet","header":header,"tabs":{{"label":"Home","id":"homeTab"}},"active_tab":"homeTab","sections":sections};
