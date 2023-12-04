// slidesArray = List();
// slidesArray.add({"type":"text","title":"Webhook","buttons":{{"label":"Create Webhook","type":"+","action":{"type":"invoke.function","data":{"name":"authentication"},"confirm":{"title":"Generate Webhooks for a GitLab Project","description":"Connect to GitLab Projects from within Cliq","input":{"type":"user_webhook_token"}}}}},"data":"Expected price : "});
// response = Map();
// response.put({"text":"Webhook token","bot":{"name":"Amazon Bot","image":"https://i.postimg.cc/KcKstCmd/logo.png"},"slides":slidesArray});
response = {"text":"Click on the token generation button below!","buttons":{{"label":"Create Webhook","type":"+","action":{"type":"invoke.function","data":{"name":"authentication"},"confirm":{"title":"Generate Webhooks for a GitLab Project","description":"Connect to GitLab Projects from within Cliq","input":{"type":"user_webhook_token"}}}}}};
return response;
