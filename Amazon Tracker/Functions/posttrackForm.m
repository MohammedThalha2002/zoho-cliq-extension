response = Map();
formData = form.get("values");
email = user.get("email");
url = formData.get("url");
price = formData.get("price");
id = user.get("organization_id");

params = Map();
params.put("email",email);
params.put("url",url);
params.put("exp_price",price);
params.put("userId",id);

url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/addtrack"
	type :POST
	parameters:params
];
if(track.get("status") == "success")
{
	result = {"text":"Product added successfully🔥","status":"success","type":"banner"};
	return result;
}
else
{
	result = {"text":"Something went wrong 😓","status":"failure","type":"banner"};
	return result;
}
return response;