/**
 * Created by Dennis on 12.09.2016.
 */
function UserListUpdater(url, containerId) {

    var container = document.getElementById(containerId);

    var socket = new WebSocket(url);

    var updateUserList = function(jsonData) {

        container.innerHTML = "";

        var userdata = jsonData.userlist;

        for(var i = 0; i < userdata.length; i++) {

            container.innerHTML += "<p>" + userdata[i].username + "</p>";
        }
    };

    socket.onopen = function(event) {

        var json = JSON.parse(event.data);

        updateUserList(json);
    };

    socket.onmessage = function(event) {

        var json = JSON.parse(event.data);

        updateUserList(json);

    };

    socket.onerror = function(event) {

        alert(event.data);
    };
}