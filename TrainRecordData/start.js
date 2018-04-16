var client = new Messaging.Client(hostname, port, cliendid);

var options = {

	timeout: 3,
	onSuccess: function () {
            alert("Connected");
        },

	onFailure: function (message) {
	    alert ("Connection failed"+message.errorMessage);
	}

};

client.connect(options);

client.subscribe("testtopic", {qos: 2});
