This project is made for [The Odin Project](http://theodinproject.com)'s [Ruby Projects: Advanced Building Blocks](http://www.theodinproject.com/ruby-programming/advanced-building-blocks).

## Project 1: Bubble Sort
Implement two bubble sort methods: 
- `bubble_sort` - takes an array and returns a sorted array
- `bubble_sort_by` - sorts an array but accepts a block.

```
> bubble_sort([4,3,78,2,0,2])
=> [0,2,2,3,4,78]

> bubble_sort_by(["hi","hello","hey"]) do |left,right|
>   left.length - right.length
> end
=> ["hi", "hey", "hello"]
```

## Project 2: Enumerable Methods
Implement enumberable methods: `each`, `each_with_index`, `select`, `all?`, `any?`, `none?`, `count`, `map`, `inject`.

`my_map` - can take either a proc or a block.

`multiply_els` - multiplies all the elements of the array together by using `my_inject`, e.g. multiply_els([2,4,5]) #=> 40



