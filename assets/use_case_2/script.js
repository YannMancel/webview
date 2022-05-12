function submit() {
    var coloredDiv = document.getElementById('coloredDiv');
    coloredDiv.setAttribute('style', 'background:red;')

    // Send message to flutter app
    JavascriptChannel.postMessage('Hello World from Javascript');
}

function ok() {
    var coloredDiv = document.getElementById('coloredDiv');
    coloredDiv.setAttribute('style', 'background:orange;')
}