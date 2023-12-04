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