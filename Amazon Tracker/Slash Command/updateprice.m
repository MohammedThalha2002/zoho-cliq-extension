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
	url = "https://amazon-scraper-black.vercel.app";
	tracks = invokeurl
	[
		url :url + "/track-details/" + user.get("email")
		type :GET
	];
	options = List();
	tracks = tracks.get("docs").toList();
	if(tracks.size() > 0)
	{
		for each  track in tracks
		{
			id = track.get("_id");
			title = track.get("title");
			options.add({"value":id,"label":title});
		}
		form = {"type":"form","title":"Update Price Form","name":"update-form","hint":"Update the price of the Product","button_label":"Update","inputs":{{"name":"products","label":"Select the product","placeholder":"Choose your product from the list","multiple":false,"mandatory":true,"type":"select","options":options},{"name":"expected-price","label":"Expected Price","placeholder":"1500","min":"0","max":"1000000","mandatory":true,"type":"number"}},"action":{"type":"invoke.function","name":"updateCommandForm"}};
		return form;
	}
	else
	{
		msg = "No tracked products found! 😕\nIt seems like you haven't added any Amazon products to track yet. To get started, use the /newproduct command to add a product or visit the Amazon website to find items you'd like to monitor. 🛍️✨";
		return {"text":msg};
	}

}
