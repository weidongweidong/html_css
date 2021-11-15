import java.text.*;
import java.util.*;




public class rangeDate{
    public static void main(String[] args) throws Exception {
        ArrayList result =  RangeDate("2020-01-09","2020-03-01");
        System.out.println(result.toString());
    }
    

    public static ArrayList RangeDate(String startDate,  String  endDate) throws Exception{
        ArrayList result = new ArrayList();
        try {
            SimpleDateFormat simp = new SimpleDateFormat("yyyy-MM-dd");
            Date start = simp.parse(startDate);
            Date end = simp.parse(endDate);
            
            while(start.getTime() <= end.getTime()){
                String stratStr = simp.format(start);
                // System.out.print(stratStr + " ");
                result.add(stratStr + "" );
                start = new Date(start.getTime() + 1000 * 60 * 60 * 24);
            }
        } catch (Exception e) {
            //TODO: handle exception
            System.out.println(e);
        }
        return result;
    }
}