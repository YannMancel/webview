function ready() {
    // Send message to flutter app
    JavascriptChannel.postMessage('DOM is ready');
}

document.addEventListener("DOMContentLoaded", ready);

function setupData(data, radius, blur, gradient, max) {
    var heat = simpleheat('canvas')
        .data(data)
        .radius(radius, blur)
        .gradient(gradient)
        .max(max)
        .draw();
}
