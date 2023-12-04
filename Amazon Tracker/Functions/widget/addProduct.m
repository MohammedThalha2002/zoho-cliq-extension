url = "https://amazon-scraper-black.vercel.app";
auth = invokeurl
[
	url :url + "/chech-auth/" + user.get("email")
	type :GET
];
if(auth.get("status") == "failed")
{
	result = {"text":"You haven't authorized the application yet. Authorize using  /authorize command","status":"failure","type":"banner"};
	return result;
}
else
{
	form = {"type":"form","title":"Amazon Tracker","name":"track-input-form","hint":"Track the prices of your favorite Amazon products with our Price Tracker Form!","button_label":"Submit","inputs":{{"name":"url","label":"Product URL","placeholder":"https://","hint":"Enter the Amazon product URL you want to track","min_length":"0","max_length":"1000","mandatory":true,"type":"text","format":"url"},{"name":"price","label":"Expected price","placeholder":"1200","hint":"Set the price at which you'd like to be notified","min":"0","max":"100000","mandatory":true,"type":"number"}},"action":{"type":"invoke.function","name":"posttrackform"}};
	return form;
}
