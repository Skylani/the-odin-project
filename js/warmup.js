function my_max(array) {
  var max = array[0];
  for (var i in array) {
    if (array[i] > max) {
      max = array[i];}
  }
  return max;
}

function vowel_count(string) {
  // g: find all vowels
  // i: ignore case
  return string.match(/[aeiouy]/gi).length;
}

function reverse(string) {
  var newStr = "";

  for (var i = string.length-1; i >= 0; i--) {
    newStr += string[i];
  }
  return newStr;
}

array = [3,1,10,2];
console.log('Max of '+ array + ': ' + my_max([3,1,10,2]));
string = 'Apple';
console.log('# of vowels in "' + string + '": ' + vowel_count(string));
console.log('Reverse of "' + string + '": ' + reverse(string));