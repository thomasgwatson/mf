var Queue = function(){
  var inStack = [];
  var outStack = [];

  this.enqueue = function(value){
    inStack.push(value)
  };

  this.dequeue = function(){
    if (outStack.length === 0){
      this.emptyInStack()
    }
    return outStack.pop()
  }

  this.emptyInStack = function(){
    while (inStack.length > 0){
      var transfer = inStack.pop()
      outStack.push(transfer)
    }
  }

  this.returnQueue = function(){
    return [inStack, outStack]
  }
}

// need an enqueue, dequeue and display public methods
// needs an emptyInStack private method

myFavQueue = new Queue()

myFavQueue.enqueue('a')
myFavQueue.enqueue('b')
myFavQueue.enqueue('c')
myFavQueue.enqueue('d')
console.log(myFavQueue.returnQueue())

myFavQueue.dequeue()
console.log(myFavQueue.returnQueue())
myFavQueue.enqueue('e')
myFavQueue.enqueue('f')

myFavQueue.dequeue()
console.log(myFavQueue.returnQueue())