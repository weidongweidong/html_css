/**
 * 选择排序 -- node实现
 * 选择排序思想： 
         数组有几个值就做几-1次小遍历， 
         先默认第一个位置是最小值， 第一次遍历从第二个位置开始， 获取到数据中的最小数，遍历结束后将这个最小值与第一个数据进行换位置; 那么整个数组的第一小值就到第一位去了  
         先默认第二个位置是最小值， 第二次遍历从第三个位置开始， 获取到数据中的最小数，遍历结束后将这个最小值与第二个数据进行换位置; 那么整个数组的第二小值就到第二位去了  
         ...
 */

let arr = [12,3,35,4,5,234,23,4,3,5,2435,34,6,356,56,8,65,8,78,7,67,8,67,45,3,456,4]
let t = new Date().getTime();
console.log('排序前',arr.join(','))
for(let i =0 ; i < arr.length ; i++){
    let min_index = i ; // 本轮最小数的坐标
    for(let j = i+1;j< arr.length ; j++){
        // 看遍历的数 和  外圈最小数比， 
        if(arr[j] < arr[min_index] ){
            min_index = j
        }
    }
    let temp = arr[i]
    arr[i] = arr[min_index]
    arr[min_index]= temp
}
console.log('排序花费:',new Date().getTime() - t +'ms')
console.log('排序后',arr.join(','))
