
var gridWidth = 40;
var gridHeight = 30;
var square = '<div class="square"></div>';
var squareClr = '<div class="square clear"></div>';
var container = $('.grid');
var squareClass = $('.square');


$(document).ready(function() {

  var snake = (function() {
    var direction = 'r';
    var parts = [[3,1], [2,1], [1,1]];
    var length = 3;

    // move snake in current direction ev speed ms
    var run = setInterval(function() {move();}, 1000);

    var init = function() {

      // draw initial snake
      for (var i = 0; i < length; i++) {
        var nthChild = pos(parts[i]);
        part = container.children().eq(nthChild);
        part.css("background-color", "red");
      }

      $(document).keydown(function(e) {
        switch (e.which) {
          case 39:
            if (!overlap('r')) {
              direction = 'r';
            }
            break;

          case 40:;

            if (!overlap('d')) {
              direction = 'd';
            }
            break;

          case 37:
            if (!overlap('l')) {
              direction = 'l';
            }
            break;

          case 38:
            if (!overlap('u')) {
              direction = 'u';
            }
            break;

          // case 32:
          //   clearInterval(snake.run); // stop loop
          //   break;

          default:
        }

      });

    };


    var generateFood = function() {
      var nthChild = Math.floor(Math.random() * gridWidth * gridHeight);


    };

    // Check if new head will overlap its second part
    // Prevent snake from going in the opposite direction
    var overlap = function(d) {
      if (length < 2)
        return false;

      // head = parts[0];
      var newHead = getNewHeadCoord(d);

      if (newHead[0] == parts[1][0] && newHead[1] == parts[1][1]) {
        return true;
      } else {
        return false;
      }
    };

    // TODO: fix new head not updated
    // Return new head coordinate based on the direction
    var getNewHeadCoord = function(d) {
      var oldHead = parts[0];
      var newHead = oldHead;

      switch (d) {
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

      // debug
      // console.log(`oldhead: ${oldHead}`);
      // console.log(`newhead: ${newHead}`);

      return newHead;
    };


    // update parts of snake after one move
    var move = function() {
      var oldTail = parts[length-1];
      var newHead = getNewHeadCoord(direction);
      // console.log('newhead:'+newHead[0]+','+newHead[1]);
      // console.log('parts:'+parts[0][0]+' '+parts[0][1]+','+parts[1][0]+' '+parts[1][1]+','+parts[2][0]+' '+parts[2][1]);

      // check if new head valid
      if (badMove(newHead)) {
        console.log('Game Over!');
        clearInterval(run); // stop loop
        return;
      }

      // add new head
      parts.unshift(newHead);

      // remove tail
      parts.pop();

      // update interface
      update(newHead, oldTail);
    };

    var badMove = function(head) {
      // out of grid
      if (head[0] > gridWidth || head[0] < 1 || head[1] > gridHeight || head[1] < 1) {
        console.log(`coord: ${head[0]}, ${head[1]}`);
        return true;
      }

      // hit itself (5th part and beyond)
      if (findPart(head)) {
        console.log('hit');
        return true;
      }

      return false;
    };

    // if found: return true
    // else return false
    var findPart = function(coord) {
      // can only hit 3rd and beyond
      for (var i = 3; i < length; i++) {
        if (comparePart(coord, parts[i])) {
          return true;
        }
      }

      return false;
    };

    // return true if same
    // else false
    var comparePart = function(coord1, coord2) {
      if (coord1[0] == coord2[0] && coord1[1] == coord2[1]) {
        return true;
      }

      return false;
    };

    // update snake
    var update = function(head, tail) {
      // add head
      dot = container.children().eq(pos(head));
      dot.css({
        'background-color': 'red',
      });

      // remove tail
      dot = container.children().eq(pos(tail));
      dot.css({
        'background-color': 'white',
      });
    };

    var pos = function(coord) {
      return gridWidth * (coord[1] - 1) + coord[0] - 1;
    };

    return {
      init: init,
    };

  })();

  var grid = (function() {
    for (var i = 0; i < gridHeight; i++) {
      container.append(squareClr);

      for (var j = 1; j < gridWidth; j++) {
        container.append(square);
      }
    }

    snake.init();
  })();
});
