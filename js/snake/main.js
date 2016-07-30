
var gridWidth = 40;
var gridHeight = 30;
var square = '<div class="square"></div>';
var squareClr = '<div class="square clear"></div>';
var container = $('.grid');
var squareClass = $('.square');

var grid = {
  init: function() {
    for (var i = 0; i < gridHeight; i++) {
      container.append(squareClr);

      for (var j = 1; j < gridWidth; j++) {
        container.append(square);
      }
    }

    snake.init();
  },

};

var snake = {
  direction: 'r',
  parts: [],
  length: 0,

  // move snake in current direction ev speed ms
  run : setInterval(function() {snake.move();}, 300),

  init: function() {
    snake.parts = [[3,1], [2,1], [1,1]];
    snake.length = 3;

    // draw initial snake
    for (var i = 0; i < snake.length; i++) {
      var nthChild = snake.pos(snake.parts[i]);
      part = container.children().eq(nthChild);
      part.css("background-color", "red");
    }

    $(document).keydown(function(e) {
      console.log(e.which);
      switch (e.which) {
        case 39:
          if (!snake.overlap('r')) {
            snake.direction = 'r';
          }
          break;

        case 40:
          if (!snake.overlap('d')) {
            snake.direction = 'd';
          }
          break;

        case 37:
          if (!snake.overlap('l')) {
            snake.direction = 'l';
          }
          break;

        case 38:
          if (!snake.overlap('u')) {
            snake.direction = 'u';
          }
          break;

        case 32:
          clearInterval(snake.run); // stop loop
          break;

        default:
      }

    });

  },

  // check if new head will overlap its second part
  overlap: function(direction) {
    var newHead = null;
    if (snake.length < 2)
      return false;

    head = snake.parts[0];

    switch (direction) {
      case 'r':
        newHead = [head[0]+1,head[1]];
        break;
      case 'l':
        newHead = [head[0]-1,head[1]];
        break;
      case 'u':
        newHead = [head[0],head[1]-1];
        break;
      case 'd':
        newHead = [head[0],head[1]+1];
        break;
    }

    // debug
    // console.log(`head:${head}`);
    // console.log(`2nd:${snake.parts[1]}`);

    if (newHead[0] == snake.parts[1][0] && newHead[1] == snake.parts[1][1]) {
      return true;
    } else {
      return false;
    }
  },


  // update parts of snake after one move
  move: function() {
    var oldHead = snake.parts[0];
    var oldTail = snake.parts[snake.length-1];
    var newHead = null;

    // create new head
    switch (snake.direction) {
      case 'r':
        newHead = [oldHead[0]+1, oldHead[1]];
        break;

      case 'l':
        newHead = [oldHead[0]-1, oldHead[1]];
        break;

      case 'u':
        newHead = [oldHead[0], oldHead[1]-1];
        break;

      case 'd':
        newHead = [oldHead[0], oldHead[1]+1];
        break;
    }

    console.log("checking new head");
    // check if new head valid
    if (snake.badMove(newHead)) {
      console.log('Game Over!');
      clearInterval(snake.run); // stop loop
      return;
    }

    // add new head
    snake.parts.unshift(newHead);

    // remove tail
    snake.parts.pop();

    console.log("updating new head");
    // update interface
    snake.update(newHead, oldTail);

  },

  badMove: function(head) {
    // out of grid
    if (head[0] > gridWidth || head[0] < 1 || head[1] > gridHeight || head[1] < 1) {
      console.log(`coord: ${head[0]}, ${head[1]}`);
      return true;
    }

    // hit itself (5th part and beyond)
    if (snake.findPart(head)) {
      console.log('hit');
      return true;
    }

    return false;
  },

  // if found: return true
  // else return false
  findPart: function(coord) {
    // can only hit 3rd and beyond
    for (var i = 3; i < snake.length; i++) {
      if (snake.comparePart(coord, snake.parts[i])) {
        return true;
      }
    }

    return false;
  },

  // return true if same
  // else false
  comparePart: function(coord1, coord2) {
    if (coord1[0] == coord2[0] && coord1[1] == coord2[1]) {
      return true;
    }

    return false;
  },

  // update snake
  update: function(head, tail) {
    // add head
    dot = container.children().eq(snake.pos(head));
    dot.css({
      'background-color': 'red',
    });

    // remove tail
    dot = container.children().eq(snake.pos(tail));
    dot.css({
      'background-color': 'white',
    });
  },

  pos: function(coord) {
    return gridWidth * (coord[1] - 1) + coord[0] - 1;
  },

};

$(document).ready(grid.init());