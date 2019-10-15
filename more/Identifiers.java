import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Identifiers{



    private final String value;
    private final int line;
    private final int column;
    public static ArrayList<Identifiers> list = new ArrayList<Identifiers>();

    public Identifiers(int var1, int var2, String var3) {
        this.line = var1 + 1;
        this.column = var2;
        this.value = var3;
        list.add(this);
    }



    public String toString(){
            final String value	= this.value != null? this.value.toString() : "null";
            return value+"\t : "+line;
    }


    public static ArrayList<Identifiers> removeDuplicates(ArrayList<Identifiers> list)
    {
        ArrayList<Identifiers> newList = new ArrayList<Identifiers>();
        for (Identifiers element : list) {
            int i = 0;
            for (Identifiers temp : newList){
                String t = element.value;
                String s = temp.value;
                if (t.equals(s)) {
                    i=i+1;
                }
            }
            if (i==0){
                newList.add(element);
            }
        }
        return newList;
    }


    public static void parcoursList(){
        ArrayList<Identifiers> newlist = new ArrayList<Identifiers>();
        newlist = removeDuplicates(list);
        System.out.print("Identifiers \n");
        for (Identifiers temp : newlist) {
            System.out.print(temp.value+" "+temp.line+"\n");

            }
        }

}
