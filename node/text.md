

    ## node.js
 

    Node.js 以下几个特点  也是他能够实现高并发的原理：
        1 单线程。 
        2 非阻塞I/O  （non-blocking I/O）
        3 事件驱动/事件循环
    
    并且在说下Node.js 所适用的场景。 


    

    1 Node.js 的诞生：
    
    2008年Goole 发明的 Chrome 浏览器 使用V8引擎来解析 js 程序， 
    v8引擎是用 c++ 
    v8引擎的优势是: 
        历史遗留问题少， 都是异步IO
        强大的编译和快速执行效率，（运用了很多算法和技巧） 
        javascript语言的闭包特性很方便
        利用了事件驱动机制
    
    
    Node.js 简介： 
        构建在chrome浏览器v8引擎上的javascript运行环境  首先他是一个运行环境   
        v8 
        使用非阻塞I/O模型， 和事件驱动， 使得Node 非常轻量高效好用 
        npm包生态比较不错， 花最小的硬件成本， 追求更高的并发， 更高的处理性能。 


    
    Node.js 底层架构是怎样的？

        底层一共由三部分来组成： 应用层， 桥（nodebindings） , 底层库。
            首先应用层上是 javascript 的代码， 
            中间有个桥， 叫  node.bindings    使用c/c++写的
            这个桥将js的代码交给底层的v8引擎来解析， 
            并且这个桥可以让javascript 直接调用c++底层的库
            底层库中有 libuv 库这里有  异步I/O功能 ， 线程池， 事件池，




