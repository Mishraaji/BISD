import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Test {

	public static void main(String[] args) throws ParseException {
		String dateHidden = "21-09-2021";
		
		/*Start
		 * Swaraj Adhav 
		 * 18 Aug 2021
		 * Date Validation
		 */
		SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date =new java.util.Date();
		
		java.util.Date date2 = format1.parse(dateHidden);
		
		System.out.println(date.before(date2)) ;
		

	}
}
