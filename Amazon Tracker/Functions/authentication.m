email = user.get("email");
userId = user.get("organization_id");
token = arguments.get("input");

params = Map();
params.put("email",email);
params.put("userId",userId);
params.put("token",token);


url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/login"
	type :POST
	parameters:params
];

if(track.get("status") == "success")
{
	result = {"text":"Authorized successfully🔥","status":"success","type":"banner"};
	return result;
}
else
{
	result = {"text":"Something went wrong 😓","status":"failure","type":"banner"};
	return result;
}