var tom = { name: "Watson" }

sayName = function(){
  console.log(this.name)
}

sayName.apply(tom) // additional arguments passed as an array
sayName.call(tom) // additional arguments passed as other arguments

var boundSayName = sayName.bind(tom);

boundSayName()