
response = Map();
formData = form.get("values");
id = formData.get("product_id");
exp_price = formData.get("exp_price");
url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/update-price/" + id + "/" + exp_price
	type :PUT
	connection:"amazontracker"
];

if(track.get("status") == "success")
{
	result = {"text":"Price updated successfully🎉","status":"success","type":"banner"};
	return result;
}
else
{
	result = {"text":"Something went wrong 😓","status":"failure","type":"banner"};
	return result;
}
