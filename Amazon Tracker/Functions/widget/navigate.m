
key = target.get("id");
curr_page = 1;
if(key.contains("next"))
{
	curr_page = key.remove("next_");
}
else
{
	curr_page = key.remove("prev_");
}
sections = list();
tabsArr = {{"label":"My Products" + curr_page,"id":"myproducts"}};
elements = list();
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email") + "/" + curr_page
	type :GET
	connection:"amazontracker"
];
meta = tracks;
tracks = tracks.get("docs").toList();
limit = 5;
if(tracks.size() > 0)
{
	count = (meta.get("page") - 1) * 2 + 1;
	for each  track in tracks
	{
		elements.add({"type":"title","text":count + ". " + track.get("title")});
		id = track.get("_id");
		curr_price = track.get("curr_price");
		exp_price = track.get("exp_price");
		features = track.get("features").get(0).toString();
		tracking = track.get("track_enabled");
		// text & subtext
		elements.add({"type":"subtext","text":"📦" + features});
		elements.add({"type":"text","text":"*💸Curr Price* : ₹" + curr_price + "\n*💵Exp Price* : ₹" + exp_price});
		// buttons
		buttons = List();
		buttons.add({"label":"Update","type":"invoke.function","name":"WIDGETupdatePrice","id":"update" + id,"emotion":"positive"});
		buttons.add({"label":"Delete","type":"invoke.function","name":"WIDGETdeleteProduct","id":"delete" + id,"emotion":"negative"});
		buttons.add({"label":"More...","type":"invoke.function","name":"WIDGETshowWeb","id":"more" + id,"emotion":"neutral"});
		if(tracking == true)
		{
			buttons.add({"label":"Disable","type":"invoke.function","name":"WIDGETenableORdiableTracking","id":"disable" + id,"emotion":"negative"});
		}
		else
		{
			buttons.add({"label":"Enable","type":"invoke.function","name":"WIDGETenableORdiableTracking","id":"enable" + id,"emotion":"positive"});
		}
		// 		
		elements.add({"type":"buttons","buttons":buttons});
		//
		elements.add({"type":"divider"});
		count = count + 1;
	}
}
else
{
	elements.add({"type":"text","text":"No tracked products found! 😕\nIt seems like you haven't added any Amazon products to track yet. To get started, use the /newproduct command to add a product or visit the Amazon website to find items you'd like to monitor. 🛍️✨"});
}
header = {"title":"My Products","navigation":"new","buttons":{{"label":"Add Product","type":"invoke.function","name":"WIDGETaddProduct","id":"section","emotion":"positive"}}};
// 
buttons = List();
if(meta.get("hasPrevPage") == true)
{
	newPage = meta.get("page") - 1;
	buttons.add({"label":"◀️ Prev","type":"invoke.function","name":"WIDGETnavigate","id":"prev_" + newPage,"emotion":"positive"});
}
if(meta.get("hasNextPage") == true)
{
	newPage = meta.get("page") + 1;
	buttons.add({"label":"Next ▶️","type":"invoke.function","name":"WIDGETnavigate","id":"next_" + newPage,"emotion":"positive"});
}
footer = {"buttons":buttons};
sections = list();
sections.add({"id":1,"elements":elements});
return {"type":"applet","header":header,"footer":footer,"tabs":{{"label":"Home","id":"homeTab"}},"active_tab":"homeTab","sections":sections};
