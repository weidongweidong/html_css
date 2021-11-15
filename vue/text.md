
1 v-for 的优先级是高于 v-if 的 
    好奇之后通过资料， 
    应该将v-if提取出来， 在外层嵌套template 用于v-if 判断，然后在 v-for 这样节省性能
    如果必须要用item里面的数据做判断的话， 可以用计算属性直接先将不需要渲染的数据过滤掉
    这样的话，就不会有不渲染的数据去捣乱了。 



vue组件 data 为什么是一个函数而不是其他  为什么vue的根实例没有这个限制？ 
    因为vue要保证这些组件实力使用的都是自己的data数据，相互不干扰 相互不污染
    因为vue的根实例是单例的，没有这个问题不会和别人污染。 

结论： 
    vue组件可能存在多个实例， 如果使用对象形式定义data  则会导致他们使用同一个data对象， 
    那状态变更会影响所有实例， 这是不合理的。而采用函数定义， initData的时候 将会返回全新的
    data对象， 有效避免了状态污染问题 而vue跟实例在创建过程中不存在该限制，也是因为根实例
    只能有一个，不需要担心这种情况。 



key 作用和 原理

    patch 就是打补丁， 
    1， key的作用主要是为了高效的更新虚拟DOM， 其原理是vue在patch过程中通过key可以
    精准判断两个节点是同一个， 从而避免频繁更新不同元素， 使用整个patch过程更加高效，
    减少了DOM操作量， 提高了性能。 
    2，另外， 若不设置key还可能在列表更新时引发一些隐蔽的bug. （比如， 有的地方本来不想让他更新，但是他更新了，）
    3, vue在使用相同标签元素的过渡切换时， 也会使用key属性， 其目的也是为了让vue可以区分他们， 
    否则vue只会替换其内部属性而不会触发过度效果。 



diff算法是什么

    1， diff算法是虚拟DOM技术的必然产物， 通过新旧虚拟DOM做对比
    将变化的地方更新到真实的DOM上， 另外，也需要diff高效的执行对比过程 ，从而降低时间复杂度

    2， vue2.x中为了降低watcher粒度， 每个组件只有一个watcher与之对应， 只有引入diff才能精确找到新旧两个虚拟DOM发生变化的地方。 

    3， 
    怎么触发diff的呢？ 
    当我们修改一个数据的时候， 由于数据的响应式 触发了setter ， setter 触发通知， 通知会将修改了数据的watcher 
    添加到异步更新队列，事件循环队列结束的时候， 会清空这个队列 ， 在清空的过程中， watchar 会执行自己的更新函数
    更新函数在执行的时候会调用我们组件的渲染函数和组件的更新函数  这时会重新渲染最新的虚拟DOM 这个时候会 比较新旧DOM 执行更新函数，  在新旧dom的对比过程中， 我们称之为打补丁， patch, 

    4, 
    diff 过程整体遵循深度优先， 同层比较的策略， 
    这里面属两个组子节点的比较是重点， 先用4个头尾节点做比较，没有相同的再通过遍历挨个查， 查找结束再按情况处理剩下的节点， 借助key通常可以非常精确的找到相同节点， 因此整个 patch 过程非常高效。 



vue组件化的理解： 
    组件是独立， 可复用的代码组织单元， 组件系统是vue核心特性之一， 它能使我们使用小型， 独立和 可复用的组件构建大型应用。
    2， 组件话开发可以大幅提高应用开发效率， 测试性， 和复用性。 代码健壮性，也好了， 团队协作也方便了， 
    3，，组件使用按分类有， 页面组件， 业务组件， 通用组件。
    4， 合理的划分组件， 有助于提升应用性能， 比如哪个地方总更新，然后就把那个地方，弄成组件， 再更新时候， 就只更新那个组件了就 ， 无关的就不比较， 不更新了， 节省了性能。 
    7 组件应该是高内聚(功能单一的，独立的)， 低耦合（不和别的地方， 组件有耦合关系）。 
    8 遵循单向数据流的原则。
    vue中常见的组件化技术有： 属性prop ， 自定义事件， 插槽， 他们主要用于组件通信， 扩展等
    本质上来讲 独立功能单元， 分治思想的落地。 




vue设计原则的理解： 
    渐进式javascrpit框架，
    易用，灵活，高效

    渐进式
        可以用一部分， 也可以慢慢往上加， 也可以全用， 这就是渐进式， 可以根据自己的所需加功能。 
    易用性
        提供数据响应式， 只会js  html css 就能上手了
    灵活性
        只用核心就可以完成功能。
    高效性
        对虚拟DOM diff算法的使用，就是高效的一个体现


mvc mvp mvvm  理解： 
    mvc 数据， 视图 ， 业务逻辑控制
    用这个的话， 前后端形成了一定对分离， 前端只完成了后端开发中的view层，  但是分的还不是特别清晰
    mvp 可以理解为一个中间人， 它负责view 和 model 之间的数据流动， 防止view和model 直接交流。 
    mvvm 
    model , view , viewModel  
    数据响应式， 用一套更新策略自动将数据变化转换为视图更新 ， 并且自动的去响应数据变化的
    核芯还是通过事件监听响应视图中用户交互修改Model中的数据 ，
    mvvm 在保持 view 和 model 松耦合的同时， 还减少了维护它们关系的代码， 使 我们专注于业务逻辑， 开发效率和可维护性。 


vue 组件间的通信方式有哪几种方式？ 
    1,props 
    2,$emit , $on 事件总线
    3,vuex 
    4,$parent $children


    使用场景 分为

    父子通信， 
        子组件中 $emit("xxxx",data) , 在父组件中 :xxxxx="bbbbb" 就触发了bbbbb, 
    兄弟通信,   
        bus, 写一个 new Vue() 实例， 然后暴露， 在两个子组件中都引入整个bus， 然后一个  bus.$emit("xxx",data)
        另一个 mounted() 中 写， bus.$on("xxx",callback);
    跨层组件通信
        vuex
    $parent ,$children 
    在 子组件中， $parent   就可以拿到这个子组件的父组件对象，可以看到父组件的data, 也可以直接调用方法， 
    $children 在父组件中， this.$children  获取的是 子组件集合， 是个数组，然后就可以获取到子组件的对象， 并且可以调用子组件的方法。 
     
    $refs :
    给子组件起个名字 : <xx ref="abc"></xx>
    在方法中就可以使用 this.$refs.abc 获取到这个组件对象， 并且可以调用它的方法。




vue性能优化方法 ：
    1， 路由的懒加载： 按需求加载
    router 是一个对象，  new Router{routes: []}  这里面的对象就是下面这种  要按需求引入,
    {
      path: '/service/list',
      name: 'serviceList',
      component: () => import('./views/worktable/components/serviceTable.vue')
    },

    2， keep-alive 缓存页面 将需要的页面缓存起来
    include=""    exclude="" 里面装着组件名称，说的谁看他们 他们才会被缓存， 或者才不会被缓存
    <keep-alive>
        <router-view v-if="$route.meta.keepAlive"></router-view>
    </keep-alive>
    让组件缓存还可以通过 路由中的 meta 对象中 弄个标识缓存不缓存的属性，keepalive
    如果是true的话， keep-alive 里面的开始渲染， 
    如果是false     keep-alive 外面的开始渲染。 


    <keep-alive>
        <router-view v-if="this.$route.meat.keepAlive"></router-view>
        <!--这里是会被缓存的组件-->
    </keep-alive>

    <keep-alive v-if="!this.$router.meta.keepAlive"></keep-alive>
    <!--这里是不会被缓存的组件-->
    

    3 v-show 复用DOM
    其实应该多用 v-show 少渲染。
    v-if DOM结构删除和新增， 但是v-show就是 display:none;

    4 v-if 和 v-for v-if 放上层  或者， 用计算属性 获取不用渲染的东西， 

    5， 如果有 setInterVal settimeout 这些需要在 beforeDestroy() 钩子函数中进行销毁， 避免内存泄露
    
    6， 第三方插件 按需引入
    import {xx,xx} from "element-ui";

    7, 子组件分割， 让耗性能自成一个组件 ，  只渲染一小部分， 也是好的解决方法。

    8 页面里不要老用 this， 需要啥先提出来， 用， 用完再赋值回去，老引用this ，有性能损耗的。 

    

vue3 新特性： 
    主要改进在于 
        更快：
            虚拟DOM重写， 
            优化slots 生成， 
            静态树提升
            静态属性提升
            基于Proxy的响应式系统
        更小
        更加友好
        更容易使用



watch 是监听属性， 

watch {
    aa: function(new , old){}
}
当aa发生变化时， 会触发他的回调函数 ， 
computed:{
    bb : function(){
        return this.number + 1 ;
    }
}

他是一个计算属性， 算好后就用bb 缓存起来， 如果 this.number 变化了， 才重新算
watch ： 一个数据影响多个数据的时候用
computed :一个数据受多个数据影响的时候用




vue 生命周期的理解: 
    beforeCreate :  这时  data 和 methods 数据都没有被初始化， vue对象只有默认的东西， 
    created: data 和 methods ,初始化好了，可以调用了。
    beforeMount:  页面编译好了， 但是还在内存中， 还没挂载到页面中去。 
    mounted:   只要执行完这个， 就代表整个vue实例已经初始化完了
    beforeUpdate： 当执行这个时 ， 页面中显示的数据还是旧的， 此时data数据时最新的 但是页面还是旧的呢， 
    updated: 当执行这个时候， 页面和data 数据就都是最新的了。 
    beforeDestory:  执行这个的时候， vue实例已经从运行进入到了销毁阶段。 就是销毁前一刻， 一切东西都还是可用的。 
    Destory :   当执行这个的时候， vue组件已经被完全销毁了， 此时， 组件中所有的数据， 方法， 指令， 过滤器都不能用了， 就留一口气了。

    新增的钩子函数： 

    activted ： keep-alive 组件激活时调用  类型于create , 但不是创建 , 是激活
    deactived ：也是对应kee-alive 没有真正移除， 只是禁用

    ![](../images/1.png)





vuex 使用及其理解： 
是用来在 没有任何关系的组件中进行共享数据 或传值的。 

组件去 触发Actions里面的动作；
this.$store.dispatch("getTime", {});
actions 通过 commit  提交给 mutations 
mutations 才可以操作 store 中的数据
暴露用 mapGetters 



nextTick 是 
我们有时候要操作DOM元素 ，但是有时候， 我们数据改了，导致DOM元素变了， 但是在DOM变之后， 我们需要再次操作这个DOM上的元素， 而此时DOM元素还没搞好， 我们就已经操作数据了， 这时操作后的数据就没有在页面上展示出来， 此时我们就应该用这个

需要在视图更新之后，基于新的视图进行操作
比如我们把一个控制显示的变量设置为了true, 紧接着获取这个刚显示出来的DOM元素，
视图没有更新呢， 肯定获取不到DOM元素， 这时我们就应该吧获取DOM元素的代码 写到  nextTick 中， 就能获取到新的视图中的DOM元素了。 


nextTick 方法实现原理
 1， vue用
 


                        





vue响应式原理：
    object.defineProperty 
    proxy

首先我们Data 通过 Observer 转换成 get 和set 的形式来追踪变化， 
然后我们通过 watcher读取数据来触发 geter 从而将我们的数据添加到依赖当中， 当我们数据发生变化的时候， 会触发我们的setter方法
setter 也会通知到我们的 watcher  , 然后watcher 向外界发送通知， 通知页面重新渲染更新



vue 对 双向绑定是什么原理 ？
    vue采用数据劫持， 结合发布者订阅者模式 通过 object.defineProperty 来劫持这个属性的set  get  方法，
在数据变动时 发布消息给订阅者 ，触发相应的监听回调方法


router 的钩子函数： 
全局路由前守卫：

    beforeEach（to , from , next） 在路由 改变前会调用这个方法   第一个参数  去哪， 第二参数 从哪里来， 第三个是 路由控制参数 
    如果正常的话，让过， 就next()
    如果不让过， 就 next(false)
    如果报错， 就 next(err)
    如果要改 
 
全局路由后守卫： 
    afterEach(to , from  )  和beforeEach  一样 ， 但是没有next();


路由配置中路由钩子： 

    beforeEnter(to, from , next())
    和全局路由是一样的。 

组件内路由钩子： 

  beforeRouteEnter (to, from, next) {
    // 在渲染该组件的对应路由被 confirm 前调用
    // 不！能！获取组件实例 `this`
    // 因为当钩子执行前，组件实例还没被创建
  },
  beforeRouteUpdate (to, from, next) {
    // 在当前路由改变，但是该组件被复用时调用
    // 举例来说，对于一个带有动态参数的路径 /foo/:id，在 /foo/1 和 /foo/2 之间跳转的时候，
    // 由于会渲染同样的 Foo 组件，因此组件实例会被复用。而这个钩子就会在这个情况下被调用。
    // 可以访问组件实例 `this`
  },
  beforeRouteLeave (to, from, next) {
    // 导航离开该组件的对应路由时调用
    // 可以访问组件实例 `this`
  }


