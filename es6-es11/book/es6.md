

什么是ES ？ 
  EcmaScript  脚本语言规范， javaScript 就是他的实现， 
  所以 ES新特性其实指的就是 javaSCript 的新特性 
   


为什么要学习ES6
 ES6的版本变动内容最多， 具有里程碑意义
 加入了许多新语法特性， 变成实现更简单，高效





let 关键字
    特性一 : 声明变量 变量不能重复
        声明变量 ：
        let a;
        let b,c,d;
        let e = 100;
        let f = 521 , j = "kk" , h = []; 
        变量不能重复， 否则会报错，
        let a = 1 
        let a = 2 
        ERROR:  Identifier 'b' has already been declared

    特性二： 作用域内有效
        块级作用域： 
        本来作用域有 ，全局， 函数， eval 作用域 
        用let 定义的变量都是 作用域内有效， 都属于局部作用域 但是var就不， var不是作用域内有效

    特性三： 不存在 变量提升
        let 声明的变量是不存在 变量提升的，var是可以在声明前使用，因为var可以变量提升，
        但是let 不行， 在声明之前用 是要报错的。 
        
        console.log(b)
        let b = 1
        // 报错

    特性四 ：不影响使用作用域链
        例子：当里面的函数在自己作用域中找不到a的时候 ，还是可以到上级作用域找变量的， 
        let a = "111"
        function fun(){
            console.log(a)
        }
        fun()



const 关键字
声明常量用的， 常量 就是值不能修改的变量
        声明常量：
            const SCHOOL = ""

        特性一： 
            一定要赋初始值
            例子： const A ;  会报错

        特性二： 
            一般常量使用大写 （这是潜规则而已）

        特性三：  
            常量的值不能被修改（指的是地址不能发生改变）
            例子： 
            const A = 1  
            A = 2   会报错
          
        特性四：
            块级作用域
            {
                const A = 1 
            }
            console.log(A) // 会报错 ， 因为有块级作用域 和局部变量的特点一样
        特性五：
            对于数组和对象的元素修改，不算做对常量的修改， 不会报错
            const A = [] 
            A.push("1")
            console.log(A)  // 可以

ES6 的结构赋值
    数组的
    例子： 
    const A = ['aa' ,'bb' , 'cc', 'dd' ]
    let [aa,bb,cc,dd] = A 
    console.log(aa)
    console.log(bb)
    console.log(cc)
    console.log(dd)

    对象的
    const A = {
        name :"name",
        age : "age"
    }
    let {name , age } = A 
    console.log(name)
    console.log(age)

         

模版字符串
    let text = `xxxxx
    xxxx`
    可以直接出现换行符
    let sss = "" 
    let text = `xxx${sss}xxxxx`
    可以进行变量拼接


简化对象写法
    let name = "xx"
    let change = "xx"
    let a =  {name , change , bb(){}}


箭头函数
    () =>{}
    () =>{}
    1箭头函数中的this 是静态的， this始终指向函数声明时所在作用域下的this的值。 call apply 都不会改变this指向；
    2箭头函数不能作为构造函数 实例化对象
    3不能使用 argument变量， 
    4箭头函数 的括号也可以省略（当行参有并且只有一个时）
    let a = n => { }
    5箭头函数 大括号也可以省略  如果要省略大括号那么return也必须跟着省略，并且里面的语句只能有一句才行 返回值就是语句执行结果
    let a = n => n*n 
    console.log(a(8))

    箭头函数适合与 this 无关的回调， 定时器 ，方法回调



ES6 允许给函数参数赋值初始值;
    function add(a,b,c=10){
        return a+b+c
    }
    console.log(add(1,2))
    1 行参初始值 具有默认值的参数， c=10 ，没有的话 就用 10  ，  一般位置要靠后（潜规则）， 要不就没有意义了， 
    2，可以与解构赋值结合  好处就是对象里面参数如果没传的话 ， 有默认的参数值
    例子: 
    function connect ({aa='一个a', bb ,cc}){
        console.log(aa, bb, cc )
    }
    connect({
        aa : "a",
        bb : 'b',
        cc : 'c'
    })


ES6 rest 参数
    ES6 引入 rest 参数 ，用于获取函数的实参  是用来替代 arguments 
    ... 后面的参数， 将传入的参数用这个参数来收集成一个数组 供内部使用。 
    有个注意事项就是 只能放到行参列表的最后， 放前面会报错的。 
    function a(c, ...b){
        console.log(c)
        console.log(b)
    }
    a(12,3,4,3,5,5,6,77)

    ES6 引入 rest 参数 ， 


扩展运算符
    function a(){
        console.log(arguments[2])
    }
    let arr = ['a','b','c','d']
    a(...arr) 
    调用时用， 会把arr 变成一个 参数序列 传到函数去， 在arguments 就可以看到 仿佛是正常传的实参


怎么可以用这个呢？ 
    1. 数组的合并 
    let a = ['1','2']
    let b = ['3','4']
    console.log([...a,...b])

    2. 数组的克隆
    let sanzhihua = ['e', 'g' , 'm']
    let t = [...sanzhihua] 
    这样就 t 也是sanzhihua 的内容了， 但是要注意一点， 这是浅拷贝 引用类型的还是引用之前的数据

    3，伪数组 变成真的数组， 

    总而言之 ， 就是将数组，  变成 ， 参数序列的形式，  ['1','2']  ---->     '1','2'




ES6 Symbol 表示独一无二的值。  
第7种数据类型， 是一种类似于字符串的数据类型。 
    1 Symbol 值是唯一的， 用来解决命名冲突的问题，
    2 不能与其他数据进行运算。 
    3 定义的对象不能使用 for in  循环便利， 但是可以使用Reflect.ownKeys 来获取对象的所有键名

这个东西就是为了给对象加属性用的， 保证加上的这个属性是独一无二不能覆盖的 。 
    例子： 
    let obj = {
        aaa: function(){
            console.log('我是原来的aaa')
        },
        [Symbol('aaa')] : function(){
            console.log('i am aaa')
        },
        [Symbol('bbb')] : function(){
            console.log('i am bbb')
        }
    }
    这样的话， 我们后加的这俩就不会覆盖之前已有的属性了。
    如何调用呢？ 
    let obj = {
        aaa: function(){
            console.log('我是原来的aaa')
        }
    }
    obj[Symbol.for('aaa')] = function(){
        console.log('i am aaa')
    }
    
    obj[Symbol.for('aaa')]()

    总结来说 这个东西 就是一个 创建唯一的一个变量， 但是可以带标识 我们要在找到这个唯一变量名的话， 除了用变量接收返回值，我们后面用这个返回值， 
    另一个方法就是 创建的时候 ，用for 给个标记， 然后用的时候可以 根据这个标记找到这个唯一的值。 


    Symbol 还被用在对象内部自定义的方法 
    class Person{
        static [Symbol.hasInstance](item){
            console.log('has', item)
            // 这个方法是当这个类被用来 instanceof 时自定义调用的 ， 像这种方法还有很多， 都是用来改变自定义自带方法用的。 
            return true
        }
    }
    console.log({} instanceof Person)




迭代器:
    iterator 是一种接口，  任何数据结构只要部署了iterator接口， 就可以完成遍历， 
    ES6 创建了一种新的遍历命令： 
        let arr = ['aa','bb','cc','dd']
        for(let i of arr){
            console.log(i)
        }
    这种遍历方法其实就是在用 iterato接口
    arr 里面的原型链中有个  Symbol(Symbol.iterator) 是一个函数， 这就是array数组的iterator接口。
    console.log(arr[Symbol.iterator]) // 可以看到是一个函数
    它的原理是 ：
        1 创建一个指针对象， 指向当前数据结构的起始位置
        2 第一次调用对象的next方法， 指针自动指向数据结构的第一个成员
        3 接下来不断调用next方法， 指针一直往后移动，直到指向最后一个成员
        4 每调用next方法返回一个包含value 和 done 属性的对象 

    例子： 
        let arr = ['aa','bb','cc','dd']
        let _iterator = arr[Symbol.iterator]()
        console.log(_iterator.next())
        console.log(_iterator.next())
        console.log(_iterator.next())
        console.log(_iterator.next())  //{ value: 'dd', done: false }
        console.log(_iterator.next())
        console.log(_iterator.next())  //{ value: undefined, done: true }
    需要自定义遍历数据的时候， 要想到迭代器


迭代器应用 ：
    做一个自定义的迭代器
    例子:
    let obj = {
        name : "长治学院",
        class: ["网工1501班","网工1502班","网工1503班","计科1501班","计科1502班" ],
        [Symbol.iterator] : function(){
            let that = this;
            let index = 0 ;
            return {
                next: function(){
                    let obj = {};
                    if(index < that.class.length){
                        obj  = { value: that.class[index], done: false }
                    }else{
                        obj = { value: undefined, done: true }
                    }
                    index++
                    return obj
                }
            }
        }
    }
    //现在想要用面向对象的思想， 自定义遍历里面的class  怎么办， 还必须用新的遍历方法   for of   
    for(let i of obj){
       console.log(i)
    }



ES6 生成器函数
    生成器函数式ES6 提供的一种异步编程解决方案， 语法行为与传统函数完全不同
    这里所说的异步编程， 说的就是 回调函数 ， 回调函数里的代码不就是异步的嘛，不是立刻执行的 就比如 fs,  ajax  mongdb ,

    生成器其实就个函数， 特殊的函数而已
    1，命名上 名字前面要有 *
    2，代码中有 yield为代码块的分隔符
    3， 执行的时候， 返回一个迭代器， 我们只能通过迭代器的next方法来执行相应的代码块， next方法返回值是 yield 后面返回的东西。 
    function * sheng(){
        let a = 1 
        let b = 2
        let c = 3 
        yield "第一个返回"+ a 
    
        yield "第er 个返回" + b  + a 
        
        yield "第san个返回" + c + b + a
    
    }
    let s = sheng()
    console.log(s.next())  // { value: '第一个返回1', done: false }
    console.log(s.next())  // { value: '第er 个返回21', done: false }
    console.log(s.next())  // { value: '第san个返回321', done: false }

    注意生成器可以传入参数 ， 也可以使用， 
    next方法 也可以传入参数， 传入的参数将作为 上一个yield 语句的返回值 ， 
    可是有什么用呢？

    生成器函数实例：看看它为什么说是异步编程的 解决方案？ 
    // 需求, 使用生成器， 解决回调地狱的问题。  假设有三个需要异步操作的函数  1s后打印，然后过 2s后打印，然后过 3s后打印
    // 如果正常用回调函数的话， 
    // 如果多了， 就是回调地狱了
    // setTimeout(()=>{
    //     console.log("1")
    //     setTimeout(()=>{
    //         console.log("2")
    //         setTimeout(()=>{
    //             console.log("3")
    //         },3000)
    //     },2000)
    // },1000)
    
    // 但是用生成器的话，这样写 ：
    function one (){
        setTimeout(()=>{
            console.log("1")
            iterator.next(); // 调用下一个next() 执行下一个yield后的语句
        },1000)
    }
    function two (){
        setTimeout(()=>{
            console.log("2")
            iterator.next(); // 调用下一个next() 执行下一个yield后的语句
        },2000)
    }
    function three (){
        setTimeout(()=>{
            console.log("3")
            iterator.next(); // 调用下一个next() 执行下一个yield后的语句
        },3000)
    }
    // 写个生成器
    function * gen(){
        yield one();
        yield two();
        yield three();
    }
    let iterator = gen();
    iterator.next();
    
    // 下面是另一个实例： 
    // 需求, 使用生成器， 解决回调地狱的问题。  假设有三个需要异步操作的函数 我们想让它像同步一样的 挨个执行完 怎么用这个呢 ？
    // 如果正常用回调函数的话，

    // 但是用生成器的话，这样写 ：
    function one (){
        setTimeout(()=>{
            let data = "第一个数据"
            iterator.next(data);
        },1000)
    }
    function two (){
        setTimeout(()=>{
            let data = "第er个数据"
            iterator.next(data);
        },2000)
    }
    function three (){
        setTimeout(()=>{
            let data = "第三个数据"
            iterator.next(data);
        },3000)
    }
    // 写个生成器
    function * gen(){
        let onedata =  yield one();
        console.log(onedata)
        let twodata =  yield two();
        console.log(twodata)
        let threedata =  yield three();
        console.log(threedata)
    }
    let iterator = gen();
    iterator.next(); // 将这串代码启动 
    // 实际上每个小函数中的 iterator.next()   就相当于return 一样， 将当前小函数的结果返回到生成器中 ，
    // 生成器得到结果后，再向下执行。 就造成了异步变成同步的执行效果了， 


Promise 

    和 生成器技术一样， 也是ES6 引入的异步编程的解决方案， 
    语法上他是一个构造函数，用来封装异步操作并可以获取其成功或失败的结果
    1，Promise 构造函数： Promise(excutor){}
    2, Promise.propertype.then 方法
    3. Promise.propertype.catch 方法


    // 下面是一个实例： 
    let p = new Promise((resolve, reject)=>{
        setTimeout(()=>{
            // let data = "数据库中的数据"
            // 成功调用 resolve 
            // resolve(data)

            let data = "数据获取失败"
            reject(data)
            // 失败调用 reject 
        },2000)
    })
    p.then(function(value){
        console.log("成功的回调函数",value)
    },function(reason){
        console.log("失败的回调函数",reason)
    })

    // 上面就是一个new Promise 的一个实际应用， 
    // 我们当面对一个异步回调操作时 将异步回调封装到这个Promise实例对象中 ，
    // 当回调函数 调用后， 我们根据数据成功与否来调用 resolve, reject 
    // 成功调用resolve, 失败调用reject , 进而改变 Promise实力对象 的状态， 
    // Promise对象一共有三个状态， 一个初始化状态， 一个成功转台， 一个失败状态。 
    // Promise对象的then方法接受两个函数， 第一个是成功后回调函数， 第二个是失败后回调函数


    通过测试发现， 如果 await 等待返回的是一个Promise对象， 那么await 返回的数据，成功时的是 reslove中的data, 如果失败会直接抛出错误到返回值处，
    例子如下： 
    function fun(){
        return new Promise((resolve, reject)=>{
            setTimeout(()=>{
                // let data = "数据库中的数据"
                // //成功调用 resolve 
                // resolve(data)
                let data = "数据获取失败"
                reject(data)
                //失败调用 reject 
            },2000)
        })
    }
    
    async function aa(){
        try{
            let result = await fun()
            console.log(result)
        }catch(e){
            console.log("err" , e)
        }
        console.log(111)
    }
    aa()


    多个异步一起如何调用？  如果后一个想获取前一个的结果 
    // 这是第一种方法
    one.then(function(value) {
        console.log(value)
        return two(value);
    }).catch(function(e) {
        console.log('第一个发生错误',e)
    }).then(function(value) {
        console.log(value)
    }).catch(function(e) {
        console.log('第二个发生错误',e)
    }).finally(function() {
        console.log('结束')
    })

    // 第二种方法
    one.then((value)=>{
        console.log(value)
        return two(value)
    }).then((value)=>{
        console.log(value)
    }).catch((err)=>{
        console.log(err)
    })


    下面说说 promise对象的then方法的返回值，
    他是有返回值，返回值是一个promise对象，但是promise对象是有状态的。 
    这个对象状态是由 then方法中回调函数中执行结果来决定的， 
    then方法中回调函数中 
    如果返回的是一个非promise对象的话, 那么 then返回的这个promise对象状态就是成功的， 
        并且返回值就是里面返回的数据， 
    如果不返回， 那么就相当于返回了一个undefined, 那么 then返回的这个promise对象也是成功的。值也是undecide 
    如果返回的是一个promise对象的话， 那么 then返回的这个promise对象状态就是由里面promise对象的状态决定，
        内外是一致的，里面返回的值也then方法返回的值。
    如果里面抛出错误了，那么then返回的promise对象状态就是失败的，值就是里面抛出错误的值
    例子： 
    let result = p.then(value => {
        // return 'xxx'  返回的是一个非promise对象
        // return new Promise((resolve, reject )=> { 返回的是一个promise对象
        //     // resolve("ok")
        //     reject("err")
        // })
        // throw '出错了' 里面抛出错误
    })
    console.log(result)

    正因为then返回值 是一个promise对象， 所以 then可以形成链式调用， 
    这样的话，他就可以避免回调地狱了，
    例子： 
    // 模拟多次异步操作， 将结果返回到一起去
    // 这就是链式调用， 
    let one = new Promise((resolve, reject)=>{
        setTimeout(()=>{
            let data = "数据库中的数据1"
            //成功调用 resolve 
            resolve(data)
        },2000)
    })

    one.then(value=>{
        return new Promise((resolve,reject)=>{
            setTimeout(()=>{
                let data = "数据库中的数据2"
                //成功调用 resolve 
                resolve([value, data]) // 他的返回值是promise对象， 就是 one.then的返回值 ，又因为promise对象
                                       // 有then方法，来表达自己的结果， 所以可以一直往下调用
            },2000)
        })
    }).then(value=>{
        return new Promise((resolve,reject)=>{
            setTimeout(()=>{
                let data = "数据库中的数据3"
                //成功调用 resolve 
                value.push(data)
                resolve(value) 
            },2000)
        })
    }).then(value=>{
        // 三个结果的合并
        console.log(value)
    }).finally(()=>{
        console.log("结束")
    })



    下面再重点说说 Promise对象的catch方法
    其实这就是一个语法糖， catch 实际就是 也是调用的then 方法， 
    只不过这样调用的:  
    then(null,(reason)=>{
        console.log(reason)
    })
    // 这样就单独把报错回调函数单独拿出来用。 
    






ES6 集合介绍 与 API 

set 
  新的数据类型， 类似于数组， 但是里面的值是唯一的。 
  有属性和方法： 
    size, add , delete , has
  基本用法例子：
    let s = new Set()
    let s2 = new Set(['aa','bb','cc','dd','bb','dd'])
    //元素个数
    console.log(s2.size)
    console.log(s2)
    // 遍历
    for(let i of s2){
        console.log(i)
    }
    //元素添加
    s2.add("kk")
    console.log(s2)
    //元素删除
    s2.delete("bb")
    console.log(s2)
    //集合清空
    s2.clear()
    console.log(s2) 


set的实践例子： 
    // 1 数组去重
    let arr  = [1,2,3,4,5,6,4,3,4,5,2]
    let s = new Set(arr)
    console.log(s) 
    // 将set转为数组
    //arr= Array.from(s)
    // 通过扩展运算符
    console.log([...s]) 
    console.log(arr)

    // 取交集
    //let arr = [1, 2, 3, 4, 5, 6, 4, 3, 4, 5, 2]
    let brr = [3, 2, 1, 7, 8, 9]
    let s = new Set(arr)
    let result = [...s].filter(item => new Set(brr).has(item))
    console.log(result)

    let arr = [1, 2, 3, 4, 5, 6, 4, 3, 4, 5, 2]
    let brr = [3, 2, 1, 7, 8, 9]
    // 1 并集
    let  result = [...new Set([...new Set(arr),...new Set(brr)])]
    console.log(result)

    // 1 arr 的差集
    let result = [...new Set(arr)].filter(item=> !new Set(brr).has(item))
    console.log(result)

Map
    类似于对象， 键值对 形式存数据 各种对象都可以当键 也实现了iterator 可以使用 for of 




class 
    ES6为了让javascript 更像 java 更像面向对象编程， 引入的class类的概念， 其实就是一个语法糖， 
    通过这个关键字可以定义类， 
    知识点： 
        1， class 声明类，
        2， constructor 定义构造函数初始化， 
        3 ，extends 调用父级构造方法
        4， static 定义静态方法和属性， 
        5， 父类方法可以重写。 

    例子：

    //ES5  创建的类的方法
    // function Person(name, age ) {
    //     this.name = name 
    //     this.age = age 
    // }
    // Person.prototype.eat = function () {
    //     console.log("我可以打吃饭～")
    // }
    // let p  = new Person()
    // p.eat()

    // ES6 class 创建类的方法
    class Person{
        constructor(name, age ){
            this.name = name
            this.age = age 
        }
        sleep(){
            console.log('我也可以睡觉～')
        }
    }
    let p = new Person()

    类的静态属性是什么意思呢？ 
    是类本身的属性， 就比如这样： 
    function Person(name, age ) {
        this.name = name 
        this.age = age 
    }
    Person.change = ()=> console.log("我是change方法")
    在class 中 如何定义呢？ 
    用 static 关键字
    class Person{
        constructor(name, age ){
            this.name = name
            this.age = age 
        }
        static change() {
            console.log(`我是chengge方法`)
        }
    }


    下面来看看 类的继承
    首先回顾ES5
    //ES5 子类继承 父类的方法
    function Person(name, age ) {
        this.name = name 
        this.age = age 
    }
    Person.prototype.myFun = function() {
        console.log('我是父类的方法')
    }
    function Son(name, age , size) {
        Person.call(this,name, age)
        this.size = size
    }
    Son.prototype = new Person
    Son.prototype.constructor = Person
    Son.prototype.IFun = function() {
        console.log('我是子类的方法')
    }


    let s = new Son("aa" , 18 , 100)
    console.log(s)
    s.myFun()
    s.IFun()

        

    ES6 子类继承父类： 
    class Person{
        constructor(name, age ){
            this.name = name
            this.age = age 
        }
        static change() {
            console.log(`我是父类的属性方法`)
        }
        sleep(){
            console.log('父类睡觉')
        }
    }

    class Son extends Person{
        constructor(name, age, size){
            super(name ,age )
            this.size = size
        }
        static soySay(){
            console.log('我是子类的属性方法')
        }
        sonSleep(){
            console.log('子类睡觉')
        }
    }

    let p = new Son("陈伟东",'18', 10000)
    console.log(p)
    p.sleep()
    p.sonSleep()

    ES6继承也就是总结是两点， 
    1， 用 extends 声明继承的父类是谁， 
    2， 在构造函数中调用 super()  这个方法就是去调用父类的构造函数
    就相当于：Person.call(this,arg[])


    子类可以重写父类的方法， 但是不能调用父类的方法， 
    写个同名的方法， 子类就把父类的同名方法给覆盖了




下面来说: calss 中的set get 方法;

    就是 get的时候， 可以进行一些计算，动态计算， 
    修改的时候，也会触发对应方法

    class Person{
        // constructor(name){
        //     this.name = name 
        // }
        get getName(){
            console.log("获取name")
            return this.name 
        }
        set setName(name){
            this.name = name 
        }
    }
    let p = new Person(222)
    p.setName = 111
    console.log(p.getName)


下面说 ES6的 数值扩展
    // js中最小精度
    console.log(Number.EPSILON / 10 + 1 == 1)
    

下面说 ES6 里面的方法扩展
    Object.is(arg1, arg2) 判断两个值是否一样
    Object.assign(arg1, arg2) 合并两个对象为一个对象
    object.setPrototypeof()  设置原型对象
    object.getPrototypeof()  获取原型对象




ES6模块化
    模块化就是将一个大文件分成多个小文件， 
    这样 的优势
    1 防止命名冲突
    2 代码复用
    3 高维护性

模块化语法
    在小文件中 
    暴露的对象是是 module.exports 的地址值， 
    起始的时候，应该是有这么一句的: exports = module.exports 这样 exports 的地址值就是暴露的对象 
    require 的时候默认返回是 return module.exports，
    exports = module.exports = {
         xx,
         xx,
         xx
    }
    这样写 exports = module.exports 的原因是 ：为了让下面的 exports.xx  有效

    在默认情况下，module.exports 是一个Object， exports 是 module.exports 的一个引用。 大多数人都是通过 exports.xx = yy 来输出。

    当模块要输出一个非Object时（比如一个Function），可以使用 module.exports = function () {} ，此时 module.exports 被覆盖了，而 exports 还是原来的对像的引用，为了避免在后面的代码中仍然使用 exports.xx = yy 而导致不能正确输出，需要把 exports 变量也重新设置为新的 module.exports 的引用，所以一般习惯写成 exports = module.exports = xxx



    导入如何导入？ 

    1 import * as m1 from "./src/xx.js"  全部暴露到 m1 ,

    解构赋值形式： 
    2, import {aa, xx} from "./src/xx.js"  指定暴露
    3 import {aa as aa_1 , xxx} from "./src/xx.js" 指定 又用别名 
    4， import {default as m3} from "./src/m3.js"

    简便形式  针对默认暴露
    import m3 from "./src/xx.js"
    这样就是将xx.js 暴露到整体都赋给了m3 



     




ES 7 相关新特性
Array  的  inclueds 

    let  arr = ['aa','bb','cc','dd']
    console.log(arr.includes('ee'))


幂运算

    2 ** 10  就是指2 的十次方   它和 Math.pow(2,8) 是一样的。 
    console.log(2 ** 8)



ES8 新特性： 


    async , await  这两个语法结合 可以让 异步代码像同步代码一样， 

    aysnc 函数    它的返回值是 pormise对象， 
    promise对象的结果是由 async 函数执行的返回值决定的。

    先说async 函数， 
    这是一个特殊的函数， 它返回一个promise对象， 
    如果这个函数，返回值是一个普通的值， 那么async函数的返回的promise对象状态是成功的，结果是返回值。
    如果这个函数，返回的是一个promise值，那么async函数返回的promise对象状态和值 就和里面返回的promise对象的状态和值一样了， 
    如果里面抛出错误了 ，那返回值也是失败的promise对象 。


    await 表达式
    await必须放到 async 函数中， 
    await右侧表达式一般是一个promise对象， 
    await 返回的是 promise对象成功时的值， 
    await 右侧的promise如果失败了， 就会抛出异常 ， 需要通过 try.. catch 捕获处理 


    例子： 
    const p = new Promise((reslove ,reject)=>{
        reslove("成功了")
        // reject("失败了")
    })
    async function fun(params) {
        try{
            let result =  await p;
            console.log(result) // 成功了
        }catch(e){
            console.log(e)
        }
    }
    fun()



async 和 await 如果一起使用的话 会怎么样：
    会更方便， 异步代码写的像同步代码一样。 
    例子： 

    const one = new Promise((reslove ,reject)=>{
        reslove("数据1")
    })
    const two = new Promise((reslove ,reject)=>{
        reslove("数据2")
    })
    async function fun(params) {
        let aa =  await one;
        let bb = await two;
        console.log(aa)
        console.log(bb)
    }
    fun()



ES8 对象方法扩展， 
    Object.keys()    //获取对象的 key值集合
    Object.values()     //获取对象的 value 值集合。 

    


ES9 对象展开
    Rest 参数 与 扩展符

    function fun({name, ...info}) {
        console.log(name)
        console.log(info)
    }

    let obj = {
        name: '陈伟东',
        age :12 ,
        school : "长治学院"
    }

    fun(obj)  
    console.log({...obj})
    //  陈伟东
    //  { age: 12, school: '长治学院' }
    //  { name: '陈伟东', age: 12, school: '长治学院' }


    对象的扩展符 ， 也可以 合并对象， 但是后面的属性会把前面的属性覆盖掉 
    let obj =  { a : "aa"}
    let ocj =  { a : "bb"}
    console.log({...obj,...ocj})
    //{ a: 'bb' }



ES9 正则扩展-命名捕获分组
    
    let str =`<a href="http://baidu.com">百度</a>`
    let reg = /<a href="(?<url>.*)">(?<text>.*)<\/a>/
    let result = reg.exec(str)
    console.log(result)
    如果捕获分组中加一个(?<xxxx>) 
    这样的话 groups 对象里面就有了 url 和  text分组的数据了



ES9 正则扩展-反向断言
    根据目标的前后的数据来判断是不是我们要的数据
    //正向断言
    let str =`jsjdas12312312知道么3428347234呵呵`
    let reg = /\d+(?=呵)/  // 正向断言  我们要目标后面是 呵 的
    let result = reg.exec(str)
    console.log(result)

    //反向断言
    let str =`jsjdas12312312知道么3428347234呵呵`
    let reg = /(?<=das)\d+/  // 反向断言  我们要目标前面是 das 的
    let result = reg.exec(str)
    console.log(result)

    正则中  . 元字符， 是除换行符以外的任意单个字符

    加了一个 和  i g,  一样的s , 




ES10特性:
    给Object 加了一个方法，  entries()
    这个是 Object.formEntries() 的逆运算；
    Object.formEntries([
        [key, value ]
        [key, value ]
    ]) 是将二维数组， 转为对象， 
    // 或者将map  转为对象
    {key: value , key : value }


    entries({key; value })
    [[key,value]]





ES10
    字符串方法扩展:   trimStart    trimEnd

    用来清除字符串两侧空白用的

    let str = "      trimStart       "

    // 去除两侧空白字符
    let str = "      trimStart       "
    str = str.trimStart().trimEnd()
    console.log(str)



数组方法扩展：  
    flat , flatMap 
    将多维数组，转为低纬度数组， 参数为 深度

    let arr = [1,3,3,4,5,[12,3,4,5,[12,23,23]]]
    cosnole.log(arr.flat(*))
    map 就是循环， 但是 循环如果返回的是[] , 那么返回的就是一个二维数组了， 
    let arr = [ 1,2,3,4,[6,5]]
    console.log(arr.flat(0))



ES10 新特性
    // 创建Symbol, 
    let s = Symbol.for('xxx')
    console.log(s.description)

    

bigint 
    数字后面加个n， 就是一个新的数据类型
    let a = BigInt("9007199254740995");
<a href="../code/t_1.js"></a>



