
response = Map();
formValues = form.get("values");

id = formValues.get("select").get("value");
title = formValues.get("select").get("label");

url = "https://amazon-scraper-black.vercel.app";
track = invokeurl
[
	url :url + "/delete/" + id
	type :DELETE
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
