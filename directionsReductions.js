// Problem: reduce a string 
// Edge cases
// Datastructures: array
// Algo:
// traverse the array looking for direct opposite
// if found one, reduce the array
// do the same on the reduced array
// if no reduction possible return the array
// ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
// ["SOUTH", "EAST", "WEST", "NORTH", "WEST"]
// ["SOUTH", "NORTH", "WEST"]
// ["WEST"]
function dirReduc(arr) {
    if (arr.length === 0) return;
    var directions = { 
      NORTH: -1,
      SOUTH: 1,
      EAST: -2,
      WEST: 2,
    }
    var i;
    for (i = 0; i < arr.length; i++) {
      if (directions[arr[i]] + directions[arr[i + 1]] === 0) {
        arr.splice(i, 2);
        dirReduc(arr);
      }
    }
    return arr;
}

dirReduc(["NORTH", "SOUTH", "EAST", "WEST", "EAST", "WEST"]);
