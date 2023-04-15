const WebSocket = require("ws");
const wss = new WebSocket.Server({ port: 8080 });

wss.on("connection", (ws) => {
  console.log("Client connected");

  // Send data to the client every second
  const interval = setInterval(() => {
    ws.send("Hello from the server!");
  }, 5000);

  //    recives data from client
  ws.on("message", (message) => {
    console.log(`Received message => ${message}`);
  });

  ws.on("close", () => {
    console.log("Client disconnected");
    clearInterval(interval);
  });
});
