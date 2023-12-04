
baseUrl = "https://amazon-fetch-details-by-url.vercel.app/";
params = Map();
params.put("url", url);
track = invokeurl
[
	url :baseUrl
	type :POST
	parameters : params
];

description = track.get("features").get(0);
curr_price = track.get("curr_price");
inStock = track.get("inStock");
if(inStock == true)
{
   inStock = "IN STOCK";
}
else
{
   inStock = "OUT OF STOCK";
}
rating = track.get("rating");
stars = "";
if(rating < 5)
{
   stars = "⭐⭐⭐⭐⭐";
}
if(rating < 4)
{
   stars = "⭐⭐⭐⭐";
}
if(rating < 3)
{
   stars = "⭐⭐⭐";
}
if(rating < 2)
{
   stars = "⭐⭐";
}
if(rating < 1)
{
   stars = "⭐";
}

return {
   "title": track.get("title"),
   "type": "link",
   "provider_url": "https://www.amazon.in/",
   "faviconlink": "https://i.postimg.cc/qqCBQZKB/free-amazon-2296099-1912058.png",
   "thumbnail_url": track.get("imgUrl"),
   "description": description,
   "fields": {
      "data": [
         {
            "label": "Price💵",
            "value": "₹" + curr_price
         },
         {
            "label": "Stock",
            "value": inStock
         },
         {
            "label": "Rating",
            "value": "(" + rating + ") " + stars
         }
      ]
   },
   "actions": [
      {
         "hint": "Add Product to the track",
         "style": "+",
         "label": "Add Product",
         "type": "button",
         "params": {
            "action": "addProduct"
         }
      }
   ],
   "dynamic_actions": true
};
