//用typeof 可以检查类型
// let a = "chen";
// let b = 123;
// let c =  true;
// let d = null;
// let e = undefined;
// console.log(typeof d);

//强制类型 转换 成 string
// let a = null;
// 两种方式可以转换成 stirng ,
//注意， null, undefined 是不可以转为string的，没有这个toString方法，
//但是通过String(a)可以;
// a = a.toString();

// let a  = "12"

// a = a - 2;


// console.log(typeof a);
// console.log(a);

// let a = false && 0;
// console.log(a); 
// var obj = {};
// var aa = new Object();
// console.log(typeof obj)
// console.log(typeof aa);
// console.log(obj.toString())

// let a  = {b:2};
// console.log("c" in a );

// var fun = new Function();
// console.log(typeof fun)

// // 声明 函数
// function a (){

// }
// // 匿名函数赋值给变量。 
// let b = function(){

// };

// 立即执行函数 
// (function(){
//     console.log("1111");
// })();  

// function fun(){
//     console.log(this);
// }
// let obj = {
//     name:"aaaa",
//     fun:fun
// }
// obj.fun();
// fun();

function CreateDog(){
    console.log("this", this);
}

let dog = new CreateDog();
console.log(dog);
// let dog2 = CreateDog();
// console.log(dog2)