
response = Map();
card = map();
card.put("thumbnail","https://images.unsplash.com/photo-1557899563-1940fc95709c?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
response.put("card",card);

if(newuser)
{
	response.put("text","Hey *" + user.get("first_name") + "* ! Thank you for subscribing!\n\nWelcome to the *Amazon Tracker for Zoho Cliq!* 🚀\nYou're now connected to our extension, designed to keep you in the loop about your favorite Amazon products. Here's what you can do:\n*⭐ Post your Amazon product links and start tracking their prices.*\n*⭐ View daily morning updates summarizing the status and price details of your tracked products.*\n*⭐ Receive real-time notifications in Zoho Cliq when a product's price drops to your expected price.*\n\nStart by posting a product link, and let the tracking begin! 🛍️");
}
else
{
	response.put("text","Hey *" + user.get("first_name") + "* ! Thank you for subscribing! back\n\n*Welcome back to the Amazon Tracker for Zoho Cliq!* 🎉\n Ready to pick up where you left off? Post a product link, and let the savings begin! 💰");
}

buttonsList = list();
buttonsList0 = Map();
buttonsList0.put("label","Docs");
action = Map();
action.put("type","open.url");
data = Map();
data.put("web","https://billowy-tendency-afc.notion.site/Amazon-Tracker-846cab60878c46acba2a6728a8ac8428");
action.put("data",data);
buttonsList0.put("action",action);
buttonsList.add(buttonsList0);
response.put("buttons",buttonsList);
return response;
