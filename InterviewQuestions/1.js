    demo([ [2,1,5],[1,2,6],[1,3,6],[1,4,6]], 4);
    demo([[3,2,7],[3,7,9],[8,3,9]],11);
    function demo(trips, capacity) {
        let count = 0;
        for (let i = 0; i < trips.length; i++) {
          let curr = trips[i];
          let next = trips[i+1] ? trips[i+1] : [];
          if (next[1] >= curr[2]) {
            continue;
          }
          count += curr[0]
        }
        console.log(count)
        console.log(count <= capacity)
    }

   