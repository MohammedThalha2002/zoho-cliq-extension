key = target.get("id");
id = key.remove("update");
form = {"type":"form","title":"Product Update Form","name":"amazon tracker","hint":"Update your new expected price","button_label":"Submit","inputs":{{"name":"product_id","label":"Product ID","placeholder":"65634c19f40f13edda01bd72","value":id,"min_length":"0","max_length":"200","mandatory":true,"type":"text"},{"name":"exp_price","label":"Expected Price","placeholder":"Enter your new expected price","min":"0","max":"1000000","mandatory":true,"type":"number"}},"action":{"type":"invoke.function","name":"updatePriceForm"}};
return form;
