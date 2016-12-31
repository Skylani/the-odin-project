function myEach(arr, callback) {
  if(typeof callback === "function") {
    arr.forEach(function(element) {
      callback(element);
    });
  }
}

// function myMap(arr, callback) {
//   if(typeof callback === "function") {
//     var myArray = [];

//     myEach(arr, function(e){
//       myArray.push(callback(e));
//     });

//     return myArray;
//   }
// }

function myMap(arr, callback) {
  if(typeof callback === "function") {
    var myArray = [];

    myEach(arr, function(e){
      myArray.push(callback(e));
    });

    return myArray;
  }
}