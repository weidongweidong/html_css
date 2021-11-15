function testttt() {
    let capacity = 11 // 空座位
    let trips = [[3,2,8], [3,7,9], [8,1,9]] // 行程 1，乘客数 2，开始地点 3，结束地点
    // let trips = [[2,1,5],[3,3,7]] // 行程 1，乘客数 2，开始地点 3，结束地点
    let total = 1000
    // 乘客数 不能大于空座位（可拼车）
    // 本次加下次乘客数大于空座位时 下一次开始地点 不能大于结束地点
    let flag = true
    for(let i=0; i < trips.length; i++) {
      let passengers = trips[i][0]  //乘客数
      let start = trips[i][1]       //开始地点
      let end = trips[i][2]         //结束地点
  
      
      if(passengers > capacity) {
        flag = false
        console.log('超载')
        break
      }
      for(let j = i; j < trips.length; j++) {
        let next_start = 0              // 下次开始地点
        let next_pass = 0               // 下次人数
        if(j+ 1 < trips.length) {
          next_start = trips[j+ 1][1]
          next_pass = trips[j+ 1][0]
          next_end = trips[j+ 1][2]
        }
        if(passengers + next_pass > capacity && end > next_start && end < next_end) {
          flag = false
          console.log('行程冲突')
          break
        }
      }
  
     
      if(total < end) {
        flag = false
        console.log('超出距离')
        break
      }
    }
    console.log(flag)
    return flag
  }