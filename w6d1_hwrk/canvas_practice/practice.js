document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas'); // in your HTML this element appears as <canvas id="myCanvas"></canvas>
  canvas.width = 500;
  canvas.height = 500;

  var ctx = canvas.getContext('2d');
  // ctx.strokeStyle = 'black'
  ctx.lineWidth = 5;
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 400, 300);

  ctx.beginPath();
  ctx.arc(200, 150, 50, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'red';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'red';
  ctx.fill();
});
