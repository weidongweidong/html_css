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

// function CreateDog(){}
// CreateDog.prototype.name = "张三";
// CreateDog.prototype.toString = function(){
//     return "这是一个对象： name" + this.name;
// }
// let dog = new CreateDog();
// console.log(dog.toString());

let arr =  [ 0 , 1,2,3,4,5,6,7,8];
// //arr.shift(); // 删除第一个元素
// //arr.unshift(-2);  // 添加第一个元素
// arr.pop();  //删除最后一个元素
// // arr.push(12) // 添加最后一个元素
// console.log(arr);
// arr.forEach(item=>{
//     console.log(item);
// })
// for(let i = 0 ; i < arr.length ; i++){
//     console.log(arr[i]);
// }
// for(let item  in arr){
//     console.log(item);
// }

// i = 0;
// while(i < arr.length){
//     console.log(arr[i])
//     i++;
// }
arr =  [0,1,2,34,4,1,9,3,2,2,3,2,3,2,2]
// let newArr = [];
// arr.forEach(item=>{
//    if(!newArr.includes(item)){
//         newArr.push(item)
//    }
// });
// console.log(newArr);

// arr.map(function(item){
//     console.log(item);
// });

// function myMap (arr,callback){
//      arr.forEach(item=>{
//         callback(item);
//      });
// }
// let a = arr.sort(function(item){
//     console.log(item);
//     return item > 10;
// });
// console.log(arr);

// function fun(a, b){
//     console.log(this.name);
//     console.log(a);
//     console.log(b);
// }
// let obj = {
//     name : "obj"
// }

// function fun2(){
   
//     console.log(arguments.callee);
// }
// fun2(1,2);

// console.log(parseInt(Math.random() * 100));

// let a  = "abccefg";
// // | 代表或者的意思
// n = /a|b/g;
// // []里的内容也是或的关系， [ab] == a|b
// // [a-z]表示任意的小写字母，  
// // [A-Z]表示任意的大写字母， 
// // [A-z]表示任意字母
// n = /a[^b]c/i;
// console.log(n.test(a));

// let str = '<a href="http://www.baidu.com">百度</a>'
// let a = str.match(/[A-z]{4}/ig);
// console.log(a);

let phonestr = "      asdfas   dfadf115234    509808      "
// 分析手机号 的规则，  
/**
 * 第一个数字为1 
 * 第二个数字为 3-9 
 * 剩下9位数字任意， 
 * 9位以后不能有了，
 * ^1  [3-9] [0-9]{9}$ 
 */
// let reg = /^1[3-9][0-9]{9}$/
// console.log(reg.test(phonestr));

// let reg = /^\s*|\s*$/g;
// phonestr = phonestr.replace(reg,"");
// console.log(phonestr);

// let emailStr = "Ei哈德哈水淀粉sdf dsf  dsf2511055509@qq.comdsdfassdfsdf 2314123sdf d ";
// /**
//  * 1, /d+    @   /w+  /.  com | cn 
//  */

// let reg = /\d+@[\d|\w]\.com|cn/ig;
// let t = emailStr.match(reg);
// console.log(t);

let href = '<img src="http://www.baidu.com" alt="">';
// (http | https) :// [A-z0-9] \.[A-z] (\.[A-z]){1,2}
let reg  = /(http|https):\/\/[A-z0-9]{3,}\.[A-z]{3,}(\.[A-z]{3,}){1,2}/ig;
let t = href.match(reg);
console.log(t);
