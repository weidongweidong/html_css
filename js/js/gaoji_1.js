function Person(name , age ){
    this.name = name 
    this.age = age 
}
Person.prototype.setName = function(name) {
    this.name = name 
}

function Student(name ,age , price){
    Person.call(this,name,age)  //  为了得到属性  就是借用父类型构造函数初始化属性而已
    this.price = price
}

Student.prototype = new Person()  //  为了能够看到父类型的方法
Student.prototype.constructor= Student      // 修正constructor属性
Student.prototype.setPrice = function (price){
    this.price = price
}
var s = new Student('tom',18, 19999)
console.log(s)
