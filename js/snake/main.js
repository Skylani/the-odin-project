
var gridWidth = 40;
var gridHeight = 30;
var square = '<div class="square"></div>';
var squareClr = '<div class="square clear"></div>';
var container = $('.grid');
var iSnake = 20;

var grid = {
  init: function() {
    for (var i = 0; i < gridHeight; i++) {
      container.append(squareClr);

      for (var j = 1; j < gridWidth; j++) {
        container.append(square);
      }
    }

    grid.initSnake();
  },

  initSnake: function() {
    snakeHead = container.children().eq(500);
    snakeHead.css({
      'border-radius': '10px',
      'background-color': 'red',
    });
  }

};

var snake = {

};

$(document).ready(grid.init());