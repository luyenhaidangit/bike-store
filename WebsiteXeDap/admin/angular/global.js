var current_url = "https://localhost:7059";
makeScript = function (url) {
	var script = document.createElement('script');
	script.setAttribute('src', url);
	script.setAttribute('type', 'text/javascript');
	// document.getElementById('mainDiv').appendChild(script);
};