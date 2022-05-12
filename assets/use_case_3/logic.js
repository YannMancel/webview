window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
                               window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;

function ready() {
    // Send message to flutter app
    JavascriptChannel.postMessage('DOM is ready');
}

document.addEventListener("DOMContentLoaded", ready);

function setupData(data) {
    var radius = 25;
    var blur = 15;
    var gradient = {
        0.8: 'blue',
        0.85: 'green',
        0.90: 'yellow',
        0.95: 'orange',
        1: 'red'
    };
    var max = 18;

    var heat = simpleheat('canvas')
        .data(data)
        .radius(radius, blur)
        .gradient(gradient)
        .max(max)
        .draw();

   window.requestAnimationFrame(draw);
}
