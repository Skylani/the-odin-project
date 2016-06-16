function my_max(array) {
  var max = array[0];
  for (var i in array) {
    if (array[i] > max) {
      max = array[i];}
  }
  return max;
}

console.log(my_max([3,1,10,2]));