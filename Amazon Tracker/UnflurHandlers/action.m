
response = Map();
params = Map();
id = user.get("organization_id");
email = user.get("email");
params.put("email", email );
params.put("url",url);
params.put("exp_price", 0);
params.put("userId",id);
url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
url :url + "/addtrack"
type :POST
parameters:params
connection:"amazontracker"
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
