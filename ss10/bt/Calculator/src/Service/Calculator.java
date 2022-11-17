package Service;

public class Calculator {
    public Calculator() {
    }

    double calculator(float fo, float so, String o){
        if (o.equals("Addition")){
            return fo+so ;
        }else if(o.equals("Subtraction")){
            return fo-so;
        }else if(o.equals("Multiplication")){
            return fo*so;
        }else if(o.equals("Division")){
            try{
                return fo/so;
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return 0;
    }
}
