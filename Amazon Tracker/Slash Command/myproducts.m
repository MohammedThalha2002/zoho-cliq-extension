
// url = "https://amazon-scraper-1etb.onrender.com";
url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
msg = "";
count = 1;
slidesArray = List();
tracks = tracks.toList();
if(tracks.size() > 0)
{
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
		title = title.replaceAll("-"," ");
		exp_price = "₹" + track.get("exp_price");
		curr_price = "₹" + curr_price;
		url = track.get("url");
		id = track.get("_id");
		slidesArray.add({"type":"text","title":count + ". " + title,"buttons":{{"label":"Url","hint":"","action":{"type":"open.url","data":{"web":url}}},{"label":"Delete","hint":"","type":"-","action":{"type":"invoke.function","data":{"name":"deleteProduct"}},"key":"delete_key" + id},{"label":"Update","hint":"","type":"+","action":{"type":"invoke.function","data":{"name":"updatePrice"}},"key":"update_key" + id}},"data":"Expected price : " + exp_price + "\nCurrent price : " + curr_price});
		count = count + 1;
	}

	response = Map();
	response.put({"text":"Your Products","bot":{"name":"Amazon Bot","image":"https://i.postimg.cc/KcKstCmd/logo.png"},"slides":slidesArray});
	return response;
}
else
{
	msg = "No tracked products found! 😕\nIt seems like you haven't added any Amazon products to track yet. To get started, use the /newproduct command to add a product or visit the Amazon website to find items you'd like to monitor. 🛍️✨";
	return {"text" : msg };
}

