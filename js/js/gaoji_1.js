console.log(hasOk([[2,1,5],[3,3,7]], 4));
console.log(hasOk([[3,2,7],[3,7,9],[8,3,9]], 11));


function hasOk(trips, capacity) {
    let begin = 1000, end = 0
    trips.forEach(item => {
      let [min, max] = [item[1], item[2]]
      begin = min < begin ? min : begin
      end = max > end ? max : end
    })
    console.log(begin)
    console.log(end)
    let ok = true
    for (let i = begin; i <= end; i++) {
      let userCount = 0
      for (let item of trips) {
        let [min, max] = item.slice(1)
        if (i >= min && i < max) {
          userCount += item[0]
          if (userCount > capacity) {
            ok = false
            break
          }
        }
      }
      if (!ok) break
    }
    return ok
  }