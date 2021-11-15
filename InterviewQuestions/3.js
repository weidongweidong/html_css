
console.log(isOk([[4,2,8], [3,7,9], [8,1,9]],11))

function isOk(trips, capacity) {
    for (let i = 0; i < trips.length; i ++) {
      let trip = trips[i]
      let count = trip[0]
      let [a1, b1] = [trip[1], trip[2]]
      for (let j = i + 1; j < trips.length; j ++) {
        let nextTrip = trips[j]
        let [a2, b2] = [nextTrip[1], nextTrip[2]]
        if ((a2 >= a1 && a2 < b1) || (a1 >= a2 && a1 < b2)) {
          count += nextTrip[0]
        }
        if (count > capacity) return false
      }
    }
    return true
  }