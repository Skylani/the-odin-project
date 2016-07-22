
var gridWidth = 40;
var gridHeight = 30;
var square = '<div class="square"></div>';
var squareClr = '<div class="square clear"></div>';
var container = $('.grid');

var grid = {
  init: function() {
    for (var i = 0; i < gridHeight; i++) {
      container.append(squareClr);

      for (var j = 1; j < gridWidth; j++) {
        container.append(square);
      }
    }

    snake.init();

    $(document).keydown(function(e) {
      console.log(e.which);
    });
  },

};

var snake = {
  posX: 20,
  posY: 20,
  direction: 'r',
  parts: [],

  init: function() {
    parts = [snake.posX, snake.posY];
    snakeHead = container.children().eq(snake.headPos());
    snakeHead.css({
      'background-color': 'red',
    });
  },

  headPos: function() {
    return gridWidth * (snake.posY - 1) + snake.posX;
  },

};

$(document).ready(grid.init());