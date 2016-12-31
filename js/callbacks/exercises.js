function funcCaller(func, arg) {
  return func(arg);
}

function firstVal(arg, func) {
  if(Array.isArray(arg)) {
    return func(arg[0], 0, arg);
  }

  // is object
  for(var key in arg) {
    return func(arg[key], key, arg);
  }
}

function once(func) {
  var executed = false;
  return function() {
    if(executed) return;

    executed = true;
    func();
  }
}