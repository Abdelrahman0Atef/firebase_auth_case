const axios = require('axios');
const { GoogleAuth } = require('google-auth-library');
const path = require('path');

const topic = process.argv[2] || 'test';
const url = 'https://fcm.googleapis.com/v1/projects/fir-auth-47ebf/messages:send';

const auth = new GoogleAuth({
  keyFile: path.join(__dirname, 'serviceAccount.json'),
  scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
});

async function sendNotification() {
  try {
    const client = await auth.getClient();
    const token = await client.getAccessToken();

    const messagePayload = {
      message: {
        topic,
        notification: {
          title: `Hello, ${topic} fans!`,
          body: `You are receiving updates about ${topic}.`,
        },
        android: {
          priority: "high",
          notification: {
            channel_id: "high_importance_channel",
          },
        },
      },
    };

    const headers = {
      Authorization: `Bearer ${token.token}`,
      'Content-Type': 'application/json',
    };

    const response = await axios.post(url, messagePayload, { headers });
    console.log('✅ Message sent successfully:', response.data);
  } catch (error) {
    console.error('❌ Error sending message:', error.response?.data || error.message);
  }
}

sendNotification();
