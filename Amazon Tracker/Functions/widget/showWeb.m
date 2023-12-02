
key = target.get("id");
id = key.remove("more");
return {"type":"applet","data_type":"web_view","tabs":{{"label":"Home","id":"homeTab"}},"web_view":{"url":"https://amazon-product-view.vercel.app/" + id},"active_tab":"homeTab"};
