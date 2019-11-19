var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var port = process.env.PORT || 3000;

var userList = [];
var typingUsers = {};

var eventChat = 'chat_message';
var eventLogin = 'login';
var eventLogout = 'logout';
var eventUserList = 'userList';

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

io.on('connection', function(clientSocket){
  	clientSocket.on(eventChat, function(msg){
    	io.emit(eventChat, msg);
  	});

  	clientSocket.on(eventLogout, function(clientNickname){
    for (var i=0; i<userList.length; i++) {
      if (userList[i]["id"] == clientSocket.id) {
        		// userList.splice(i, 1);
        		userList[i]["isConnected"] = false;
        		break;
      		}
    	}
    	io.emit("userList", userList);
  	});

	clientSocket.on(eventLogin, function(clientNickname) {
      var message = "User " + clientNickname + " was connected.";
      console.log(message);

      var userInfo = {};
      var foundUser = false;
      for (var i=0; i<userList.length; i++) {
        if (userList[i]["nickname"] == clientNickname) {
          userList[i]["isConnected"] = true
          userList[i]["id"] = clientSocket.id;
          userInfo = userList[i];
          foundUser = true;
          break;
        }
      }

      if (!foundUser) {
        userInfo["id"] = clientSocket.id;
        userInfo["nickname"] = clientNickname;
        userInfo["isConnected"] = true
        userList.push(userInfo);
      }

      io.emit("userList", userList);
  	});

});


http.listen(port, function(){
  console.log('listening on *:' + port);
});
