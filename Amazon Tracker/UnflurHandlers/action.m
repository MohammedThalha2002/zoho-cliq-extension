url = "https://amazon-scraper-black.vercel.app";
auth = invokeurl
[
	url :url + "/chech-auth/" + user.get("email")
	type :GET
];

if(auth.get("status") == "failed")
{
	return {
    "bot": {
      "name": "Amazon Tracker",
      "image": "https://i.postimg.cc/KcKstCmd/logo.png"
    },
    "slides": [
      {
        "type": "text",
        "title": "*Authorization Required* 🔐",
        "buttons": [
          {
            "label": "Authorize",
            "type": "+",
            "action": {
              "type": "invoke.function",
              "data": {
                "name": "Authorization"
              },
              "confirm": {
                "title": "Generate Webhooks for Amazon Tracker",
                "description": "Connect to Amazon Tracker from within Cliq",
                "input": { "type": "user_webhook_token" }
              }
            }
          }
        ],
        "data": "⚠️You haven't Authorizationd the application yet. Authorization to get the notifications on price drop📦."
      }
    ],
    "text": "🚨🚨🚨🚨🚨"
};
} else {
	response = Map();
	params = target.get("params");
	id = user.get("organization_id");
	email = user.get("email");
	params.put("email",email);
	params.put("url",url);
	curr_price = target.get("params").get("curr_price");
	exp_price = 0;
	if(curr_price < 500)
	{
		exp_price = curr_price - 50;
	}
	else
	{
		exp_price = curr_price - 100;
	}
	params.put("exp_price",exp_price);
	params.put("userId",id);
	url = "https://amazon-scraper-black.vercel.app";
	track = invokeurl
	[
		url :url + "/addtrack-direct"
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
}