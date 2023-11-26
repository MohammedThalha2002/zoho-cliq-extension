
url = "https://amazon-scraper-1etb.onrender.com";
tracks = invokeurl
[
	url :url + "/track-details/"
	type :GET
	connection:"amazontracker"
];

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
// 	url = track.get("url").toString();
// 	url = "[link](" + url + ")";
	rows.add({
                "Title": title,
                "Expected Price": "₹" + track.get("exp_price"),
                "Current Price": "₹" + curr_price,
				"Url": "url"
    });
}

elements = list();
elements.add({"type":"title","text":"Current Price"});
elements.add(
    {
        "type":"table",
        "headers":{
            "Title",
            "Expected Price",
            "Current Price",
			"Url"
        },
        "rows": rows,
        "style":{
                "width":{
                    "50",
                    "20",
                    "20",
					"10"
					
                },
                "text_align":{
                    "center",
                    "center",
                    "center",
					"center"
                }
        }
    }
);

sections = list();
sections.add({"id":1,"elements":elements});
return {"type":"applet","tabs":{{"label":"Home","id":"homeTab"}},"active_tab":"homeTab","sections":sections};
