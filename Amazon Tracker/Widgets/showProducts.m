
// url = "https://amazon-scraper-1etb.onrender.com";
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/"
	type :GET
	connection:"amazontracker"
];
elements = list();
elements.add({"type":"title","text":"Your Products"});
tracks = tracks.toList();
if(tracks.size() > 0)
{
	rows = list();
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
		title = title.replaceAll("-", " ");
		rows.add({"Title":title,"Expected Price":"₹" + track.get("exp_price"),"Current Price":"₹" + curr_price});
	}
	elements.add({"type":"table","headers":{"Title","Expected Price","Current Price"},"rows":rows,"style":{"width":{"50","25","25"},"text_align":{"center","center","center"}}});
}
else
{
	elements.add({"type":"text","text":"No Product Tracks Found"});
}
sections = list();
sections.add({"id":1,"elements":elements});
return {"type":"applet","tabs":{{"label":"Home","id":"homeTab"}},"active_tab":"homeTab","sections":sections};
