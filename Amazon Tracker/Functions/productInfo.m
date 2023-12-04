
key = arguments.get("key");
id = key.remove("more_key");
url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/track-detail-by-id/" + id
	type :GET
];
track = track.toJSONList().get(0);
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
trackBtnLabel = "Disable";
trackBtnID = "disable" + id;
if(tracking == true)
{
	trackBtnLabel = "Disable";
	trackBtnID = "disable" + id;
}
else
{
	trackBtnLabel = "Enable";
	trackBtnID = "enable" + id;
}
// 		
return {"text":"Product Info","bot":{"name":"Amazon Tracker","image":"https://i.postimg.cc/KcKstCmd/logo.png"},"slides":{{"type":"images","title":title,"data":{imgUrl}},{"type":"label","title":inStock,"data":{{"💸Current Price":"₹" + curr_price},{"💵Expected Price":"₹" + exp_price}}},{"type":"text","title":"Rating : " + rating,"data":stars},{"type":"list","title":"Features","buttons":{{"label":"Url","hint":"","action":{"type":"open.url","data":{"web":"https://cliq.zoho.com"}}},{"label":"Update","hint":"","type":"+","action":{"type":"invoke.function","data":{"name":"updatePrice"}},"key":"update_key"},{"label":"Delete","hint":"","type":"-","action":{"type":"invoke.function","data":{"name":"deleteProduct"}},"key":"delete_key"},{"label":trackBtnLabel,"hint":"","action":{"type":"invoke.function","data":{"name":"enableORdisable"}},"key":trackBtnID}},"data":{feature1,feature2}}}};
