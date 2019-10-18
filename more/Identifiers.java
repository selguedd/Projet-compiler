import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Identifiers{



    private final String value;
    private final int line;
    private final int column;
    public static ArrayList<Identifiers> list = new ArrayList<>();

    public Identifiers(int var1, int var2, String var3) {
        this.line = var1 + 1;
        this.column = var2;
        this.value = var3;
        checkInList(this);
    }

    public String getValue(){
        return value;
    }

    public String toString(){
            final String value	= this.value != null? this.value.toString() : "null";
            return value+"\t : "+line;
    }





    public static void parcoursList(){
        System.out.print("Identifiers \n");
        for (Identifiers temp : list) {
            System.out.print(temp.value+" "+temp.line+"\n");

            }
        }

    
    private void checkInList(Identifiers var){
        int counter=0;
        for(Identifiers temp : list) {
           if (temp.getValue().equals(var.getValue())) {
               counter=-1;
           }
        }
        if (counter==0) {
            list.add(var); 
        }
    }

    }



