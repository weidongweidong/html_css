public class dd{

    public static void main(String[] args) {
        int[][] tip = {{2,1,5}};
        int capacity = 11;
        boolean result =  dd(tip , capacity);
        System.out.println(result);
    }

    public static boolean dd(int[][] tip , int capacity){
        int lucheng = 0;
        int zuo = 0;
        for(int j = 0 ; j<  tip.length ; j++){
            if(tip[j][2] > lucheng){
                lucheng = tip[j][2];
            }
        }

        for(int i=0 ; i < lucheng ; i++){
            for(int j=0 ; j < tip.length ; j++){
                if(tip[j][2] == i){
                    zuo -= tip[j][0];
                }
                if( tip[j][1] == i){
                    zuo += tip[j][0];
                }
                if(zuo < 0 || zuo > capacity){
                    return false;
                }
            }
        }
        return true;
    }
}