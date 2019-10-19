import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/** This class is used to represent each Identifier that is identified by the LexicalAnalyzer.
 */

public class Identifiers{



    private final String value;
    private final int line;
    private final int column;
    /**
     * Static ArrayList of Identifiers that is used to store the Identifiers identified by the
     * LexicalAnalyzer
     */
    public static ArrayList<Identifiers> list = new ArrayList<>();

    /**
     * Creates an Identifier, stores it in a list that will be used to print out the symbol table
     * @param var1 the line number
     * @param var2 column number
     * @param var3 value
     */
    public Identifiers(int var1, int var2, String var3) {
        this.line = var1 + 1;
        this.column = var2;
        this.value = var3;
        checkInList(this);
    }

    public String getValue(){
        return value;
    }

    /**
     * Static Method that will be used to get through the list of Identifiers and print
     * all of them with their line number to print out the symbol table
     */
    public static void parcoursList(){
        if (!list.isEmpty()){
            System.out.print("Identifiers \n");
            for (Identifiers temp : list) {
                System.out.print(temp.value+" "+temp.line+"\n");
            }
        }
        }


    /**
     * Takes an Identifier as a parameter, and checks if another identifier with the same value
     * in the arraylist "list" created above already exists, if yes it does not add it,
     * if not, it does
     * This method is used to get rid of duplicates in the list
     * If not, it adds it to the list
     * @param var
     */
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



