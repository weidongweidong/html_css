function fun(n , o){
    console.log(o)
    return {
        fun: function(m){
            return fun(m,n)
        }
    }
}



// var a = fun(0) // undefined 
// 小函数闭包产生  { n : 0 }  并且没有新的闭包对象产生 或更新， 所以一直都是第一次产生的，所以后面打印都是 0 ，
// a.fun(1)   // 0
// a.fun(2)   // 0
// a.fun(3)   // 0



// var b = fun(0).fun(1).fun(2).fun(3);
// 第一次调用fun时 闭包产生 {n : 0} 此时o没传 打印undeisfed， 第二次调用时 参数是（1，0） 所以打印了 0 ， 返回的新的小函数（闭包对象是{n:1}的）去调用大函数第三次 ， 第三次调用时 (2 ,1)  打印了1 返回的新的小函数（闭包对象是{n:2}），
// 第三次返回的小函数（闭包对象是{n:2}）去进行了第四次调用 参数（3，2） 所以打印了个 2 
// undefined
// 0
// 1
// 2



// var c = fun(0).fun(1); 
// c.fun(2)
// c.fun(3)
// 第一次调用 小函数的闭包对象产生 {n: 0}， 此时o没传 打印undeisfed, 返回的新的小函数（ 闭包对象是{n:0}的 ）去进行第二次调用，参数为（1， 0 ）所以打印了个0 , 返回了新的小函数 （闭包对象是{n : 1}）
// 第二次返回的小函数（闭包对象是{n : 1}） 进行第三次调用， 参数为（2，1）所以打印一个 1 ， 并且返回新的小函数对象（ 闭包对象是{n:2} ）  ,但是第四次调用者不是 第三次返回的小函数，用的还是第二次返回的小函数（闭包对象是{n : 1}）
// 第四次调用时，调用者还是第二次返回的小函数（闭包对象是{n : 1}），所以还是打印了个 1 
// 就是说 新返回的小函数的闭包对象是被新创建的 是结合当前的新的调用环境产生的， 但是原来那个小函数的闭包对象没有被更新
// undefined 
// 0
// 1
// 1



