window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
                               window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;

function get(id) {
    return document.getElementById(id);
}

var heat = simpleheat('canvas').data(data).max(18),
    frame;

function draw() {
    heat.draw();
    frame = null;
}

draw();

//get('canvas').onmousemove = function (e) {
//    heat.add([e.layerX, e.layerY, 1]);
//    frame = frame || window.requestAnimationFrame(draw);
//};

//var radius = get('radius'),
//    blur = get('blur'),
//    changeType = 'oninput' in radius ? 'oninput' : 'onchange';

//radius[changeType] = blur[changeType] = function (e) {
//    heat.radius(+radius.value, +blur.value);
//    frame = frame || window.requestAnimationFrame(draw);
//};