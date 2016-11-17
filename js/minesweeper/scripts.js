var Minesweeper = (function() {
  var difficulties = {
    easy: { width: 9, numOfMines: 7 }
  };
  var mineBgColor = '#EF4836';
  var revealBgColor = '#ABB7B7';


  var init = function() {
    difficulty = difficulties.easy;   // Set difficulty

    toCheckStack = new Array();
    mines = new Array();
    numOfMines = difficulty.numOfMines;

    Board.init(getWidth());
    generateMines();
    moveListener();
  };

  var flag = function(cellElem) {
    cellElem.innerHTML = 'F';
    Board.getCellObjFromElem(cellElem).reveal = true;
    numOfMines--;
  };


  var moveListener = function() {
    var cellElems = Board.cellElems;
    for(var i = 0; i < cellElems.length; i++) {
      cellElems[i].addEventListener('click', function(ev) {
        if(ev.shiftKey) {
          flag(this);
        } else {
          if(!Board.getCellObjFromElem(this).reveal) {

            revealCells(this);
          }
        }
      });
    }
  };

  var explodeAll = function() {
    for(i in mines) {
      var mine = mines[i];
      var mineElem = document.getElementById(Board.cellId(mine[0], mine[1]));
      explode(mineElem);
    }
  };


  var explode = function(mineElem) {
    mineElem.style.backgroundColor = mineBgColor;
  };



  var revealCells = function(cellElem) {
    var cellObj = Board.getCellObjFromElem(cellElem);

    if(cellObj.isMine) {
      explodeAll();
      return false;
    }

    revealCell(cellObj);

    // Show num of mines or reveal more cells
    if(cellObj.mines > 0) {
      cellElem.innerHTML = cellObj.mines;
    } else {
      revealNeighbors(cellElem);
    }

    return true;
  };

  var revealCell = function(cellObj) {
    cellObj.reveal = true;
    Board.getCellElemFromObj(cellObj).style.backgroundColor = revealBgColor;

  }

  var revealNeighbors = function(cellElem) {
    var cellObj = Board.getCellObjFromElem(cellElem);;

    toCheckStack = toCheckStack.concat(neighborsToCheck(cellObj));

    while(toCheckStack.length > 0) {
      var cell = toCheckStack.pop();

      revealCells(Board.getCellElemFromObj(cell));
    }

  };

  // Find neightbors that are not revealed yet
  var neighborsToCheck = function(cell) {
    var stack = new Array();
    var neighbors = Board.getNeighbors(cell);

    for(i in neighbors) {
      var cell = neighbors[i];
      if(!cell.reveal) {
        stack.push(cell);
        cell.inStack = true;
      }
    }

    return stack;
  };


  var show = function() {
    var cells = Board.cellElems;
    for(var i = 0; i < cells.length; i++) {
      var cellObj = Board.getCellObjFromElem(cells[i]);

      if(cellObj.isMine) {
        explode(cells[i]);
      } else {
        cells[i].innerHTML = cellObj.mines;
      }
    }

  };

  var generateMines = function() {
    for (var i = 0; i < getNumOfMines(); i++) {
      var randX, randY;

      do {
        randX = Math.floor(Math.random() * getWidth());
        randY = Math.floor(Math.random() * getWidth());

      } while(cellIsMine(randX, randY));

      putMine(randX, randY);
      mines.push([randX, randY]);
    }
  };

  var putMine = function (x, y) {
    var cell = Board.getCell(x, y);
    cell.isMine = true;
    cell.mines = 1;

    incrementNeighborMinesNum(cell);
  };

  var incrementNeighborMinesNum = function (cell) {
    var neighbors = Board.getNeighbors(cell);

    for (x in neighbors) {
      neighbors[x].mines++;
    }
  };

  var cellIsMine = function(x, y) {
    return Board.getCell(x, y).isMine;
  };

  var getWidth = function() {
    return difficulty.width;
  };

  var getNumOfMines = function() {
    return difficulty.numOfMines;
  };



  /*----------------------------------------------------
  Board
  -----------------------------------------------------*/
  var Board = (function() {
    var init = function(width) {
      Board.container = document.getElementById('board');
      Board.width = width;
      // Board.cellElems = new Array(Board.width);
      Board.cells = new Array(Board.width);
      createCells();
      draw();
      Board.cellElems = document.getElementsByClassName('cell');
    };

    var draw = function() {
      for (var i = 0; i < Board.width; i++) {
        // Create column container
        var col = document.createElement('div');
        col.className = 'col';
        Board.container.appendChild(col);
        // Board.cellElems[i] = new Array(Board.width);

        // Put cells in current column
        for (var j = 0; j < Board.width; j++) {
          var cell = document.createElement('div');
          cell.className = 'cell';
          cell.id = 'cell-' + i + '-' + j;
          Board.container.childNodes[i].appendChild(cell);
          // Board.cellElems[i][j] = cell;
        }
      }
    };

    var getCell = function(x, y) {
      return Board.cells[x][y];
    }

    var createCells = function() {
      // Create empty arrays
      for (var i = 0; i < Board.width; i++) {
        Board.cells[i] = new Array(Board.width);
      }

      // Fill each slot with a cell
      for (var i = 0; i < Board.cells.length; i++) {
        for (var j = 0; j < Board.cells[i].length; j++) {
          Board.cells[i][j] = new Cell(i, j);
        }
      }
    };

    var getNeighbors = function(cell) {
      var neighbors = new Array(),
          x = cell.x,
          y = cell.y,
          xs = [x-1, x, x+1],
          ys = [y-1, y, y+1];

      for(var i in xs) {
        for(var j in ys) {
          // Put in neighboars array if not off the board
          if(xs[i] > -1 && xs[i] < Board.width && ys[j] > -1 && ys[j] < Board.width) {
            // Put in neighbors array if not current cell
            if(!(xs[i] == x && ys[j] == y)) {
              neighbors.push(getCell(xs[i], ys[j]));
            }
          }
        }
      }

      return neighbors;
    };


    var getCellElement = function (x, y) {
      return document.getElementById(Board.cellId(x, y));
    };

    var getCellElemFromObj = function (cellObj) {
      return document.getElementById(Board.cellId(cellObj.x, cellObj.y));
    };

    var getCellObjFromElem = function(cellElem) {
      var idElems = cellElem.id.split('-');
      var x = idElems[1];
      var y = idElems[2];

      return getCell(x, y);
    };

    var cellId = function(x, y) {
      return 'cell-' + x + '-' + y;
    }


    return {
      init: init,
      getNeighbors: getNeighbors,
      getCell: getCell,
      getCellElement: getCellElement,
      getCellObjFromElem: getCellObjFromElem,
      getCellElemFromObj: getCellElemFromObj,
      cellId: cellId,
    }

  })();

  /*--------------------------------------------------
  Cell
  ---------------------------------------------------*/
  var Cell = function(x, y) {
    this.x = x;
    this.y = y;
    this.reveal = false;
    this.mines = 0;
    this.inStack = false;
    this.isMine = false;

    return this;
  }


  return {
    init: init,
    show: show,
  }
})();


Minesweeper.init();