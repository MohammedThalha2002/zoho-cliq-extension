url = "https://amazon-scraper-black.vercel.app";
tracks = invokeurl
[
	url :url + "/track-details/" + user.get("email")
	type :GET
	connection:"amazontracker"
];
options = List();
for each  track in tracks
{
	id = track.get("_id");
	title = track.get("url").remove("https://www.amazon.in/");
	i = title.indexOf("/");
	title = title.subString(0,i);
	title = title.replaceAll("-"," ");
	options.add({"value":id,"label":title});
}
form = {"type":"form","title":"Delete Form","name":"delete product","hint":"Delete your product from your track list","button_label":"Delete","inputs":{{"name":"select","label":"Select the product","placeholder":"Choose your product from the list of options","multiple":false,"mandatory":true,"type":"select","options":options}},"action":{"type":"invoke.function","name":"deleteCommandForm"}};
return form;