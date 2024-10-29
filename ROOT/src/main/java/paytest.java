import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.jmx.snmp.Timestamp;

public class paytest {
	static  int[][]  d   =  new  int[][]
		    {
		        {0,  1,  2,  3,  4,  5,  6,  7,  8,  9}, 
		        {1,  2,  3,  4,  0,  6,  7,  8,  9,  5}, 
		        {2,  3,  4,  0,  1,  7,  8,  9,  5,  6}, 
		        {3,  4,  0,  1,  2,  8,  9,  5,  6,  7}, 
		        {4,  0,  1,  2,  3,  9,  5,  6,  7,  8}, 
		        {5,  9,  8,  7,  6,  0,  4,  3,  2,  1}, 
		        {6,  5,  9,  8,  7,  1,  0,  4,  3,  2}, 
		        {7,  6,  5,  9,  8,  2,  1,  0,  4,  3}, 
		        {8,  7,  6,  5,  9,  3,  2,  1,  0,  4}, 
		        {9,  8,  7,  6,  5,  4,  3,  2,  1,  0}
		    };
		      
		    // The permutation table
		    static  int[][]  p  =  new  int[][]
		    {
		        {0,  1,  2,  3,  4,  5,  6,  7,  8,  9}, 
		        {1,  5,  7,  6,  2,  8,  3,  0,  9,  4}, 
		        {5,  8,  0,  3,  7,  9,  6,  1,  4,  2}, 
		        {8,  9,  1,  6,  0,  4,  3,  5,  2,  7}, 
		        {9,  4,  5,  3,  1,  2,  6,  8,  7,  0}, 
		        {4,  2,  8,  6,  5,  7,  3,  9,  0,  1}, 
		        {2,  7,  9,  3,  8,  0,  6,  4,  1,  5}, 
		        {7,  0,  4,  6,  9,  1,  3,  2,  5,  8}
		    };
		      
		    // The inverse table
		    static  int[]  inv  =  {0,  4,  3,  2,  1,  5,  6,  7,  8,  9};
		      
		    
	public static void main(String[] args) {
		
		//String generateH = generateVerhoeff("4101989");
		
		//boolean validateH = validateVerhoeff("4101989"+ generateH); 
		
		MessageDigest m;
		String hashtext =null;
		try {
			m = MessageDigest.getInstance("MD5");
			m.reset();
			m.update("Welcome123@@".getBytes());
			byte[] digest = m.digest();
			BigInteger bigInt = new BigInteger(1,digest);
			hashtext = bigInt.toString(16);
			// Now we need to zero pad it if you actually want the full 32 chars.
			while(hashtext.length() < 32 ){
			  hashtext = "0"+hashtext;
			}
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println(hashtext+"---------------");
		
		
		/*
		
		try {
			
			String dateString1 = "16-04-2011 17:29:01";
			Date date = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").parse(dateString1);
			String dateString2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
			System.out.println(dateString2);
			String pattern = "yyyy-MM-dd HH:mm:ss";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

			Date date1 = simpleDateFormat.parse(dateString2);
			java.sql.Timestamp sq = new java.sql.Timestamp(date1.getTime());
			System.out.println("Date "+sq);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
	// The multiplication table
    
    /*
* For a given number generates a Verhoeff digit
*
*/
       public  static  String  generateVerhoeff(String  num){
                      
               int  c  =  0;
               int[]  myArray  =  stringToReversedIntArray(num);
              
               for(int  i  =  0;  i  <  myArray.length;  i++)
               {
                       c  =  d[c][p[((i  +  1)  %  8)]  [myArray[i]]];
               }
              
               System.out.println(Integer.toString(inv[c]));
               
               return  Integer.toString(inv[c]);
       }
      
      
       /*
* Validates that an entered number is Verhoeff compliant.
* NB: Make sure the check digit is the last one.
*/
       public  static  boolean  validateVerhoeff(String  num){
              
               int  c  =  0;
               int[]  myArray  =  stringToReversedIntArray(num);
        
               for  (int  i  =  0;  i  <  myArray.length;  i++)
               {
                       c  =  d[c][p[(i  %  8)][myArray[i]]];
               }
              
               System.out.println(c  ==  0);
               
               return  (c  ==  0);
       }
      
      

       /*
* Converts a string to a reversed integer array.
*/
       private  static  int[]  stringToReversedIntArray(String  num){
              
               int[]  myArray  =  new  int[num.length()];
              
               for(int  i  =  0;  i  <  num.length();  i++)
               {
                       myArray[i]  =  Integer.parseInt(num.substring(i,  i  +  1));                                   
               }
              
               myArray  =  reverse(myArray);
              
               return  myArray;
      
       }
      
       /*
* Reverses an int array
*/
       private  static  int[]  reverse(int[]  myArray)
       {
               int[]  reversed  =  new  int[myArray.length];
              
               for(int  i  =  0;  i  <  myArray.length  ;  i++)
               {
                       reversed[i]  =  myArray[myArray.length  -  (i  +  1)];                 
               }
                              
               return  reversed;
       }
       
       /*Date dt = new Date();
       String invalidCard ="update sid set sid_status='Invalid' where Date(sid_doe)<  '"+dt+"'";
      ps2=con1.prepareStatement(invalidCard);
      ps2.executeUpdate();*/
	
       
       
       	private static final SimpleDateFormat SDF = new SimpleDateFormat("yyMMdd");
       	public static String createMrz()
       	{
       	String documentCode="IS", issuingState="IND", documentNumber="M31019952", firstOptional="<<<<<<<<<<<<<<<",
       	firstWeighingCode="731731731", MRZ="";
       	int firstWeighingCodeChar=0;
       	char firstCheckDigit;
       	Date dateOfBirth=null;
       	String sex="M", nationality="IND", secondOptional="<<<<<<<<<<<";
       	Date dateOfExpiry=null;
       	String secondWeighingCode="731731", thirdWeighingCode="731731", overallWeighingCode="73173173173173173173173173173173173173173173173173",
       	overallString="", middleMRZ="";
       	char secondCheckDigit, thirdCheckDigit, overallCheckDigit;
       	int secondWeighingCodeChar=0, thirdWeighingCodeChar=0,
       	overallWeighingCodeChar=0, overallStringCharacter=0;
       	
       	String firstName="SantoshGantiSantoshGanti", lastName="", middleName="12345", weighingDigit="731";
       	
       	int documentNumberCharacter=0,checkDigitCharacter=0,temp=0,dateOfBirthCharacter=0, dateOfExpiryCharacter=0;
       	//String applicationId="675";
       	
       	String birthDate=null;
       	String expiryDate=null;
       	
       	try
       	{
       		
       		
       			System.out.println("1");
       			firstName="SALEEM".trim().toUpperCase();
       			middleName="ahmad".trim().toUpperCase();
       			//documentNumber=resultSet.getString("sidno");
       			if(middleName!=null)
       			{
       				middleName=middleName.trim().toUpperCase();
       			}
       			else
       			{
       				middleName="";
       			}
       			
       			lastName="sheikh".trim().toUpperCase();
       			if(lastName!=null)
       			{
       				lastName=lastName.trim().toUpperCase();
       			}
       			else
       			{
       				lastName="";
       			}
       			
       			//dateOfBirth=new Date("1990-05-03");
       			//dateOfBirth=dateOfBirth.substring(2,4)+dateOfBirth.substring(5,7)+dateOfBirth.substring(8);
       			//sex=resultSet.getString(5).trim();
       			//birthDate=SDF.format(dateOfBirth);
       			birthDate = "900305";
       			//dateOfExpiry=new Date("1928-06-20");
       			//dateOfExpiry=dateOfExpiry.substring(2,4)+dateOfExpiry.substring(5,7)+dateOfExpiry.substring(8);
       			//expiryDate=SDF.format(dateOfExpiry);
       			expiryDate="280620";
       			nationality="IND".trim();
       			nationality=nationality.toUpperCase().substring(0, 3);
       			sex="M".toUpperCase();
       		
       	}catch(Exception e)
       	{
       		e.printStackTrace();
       	}
       	
       	/*for(int j=0;j<9;j++)
       	{
       		documentNumberCharacter=documentNumber.charAt(j);
       		if(j==0)
       		{
       			documentNumberCharacter=documentNumberCharacter-55;	
       		}
       		else
       		{
       			documentNumberCharacter=documentNumberCharacter-48;
       		}
       		firstWeighingCodeChar=firstWeighingCode.charAt(j)-48;
       		temp=temp+documentNumberCharacter*firstWeighingCodeChar;
       	}
       	//firstCheckDigit=temp%10;
       	System.out.println("temp = "+temp);
       	System.out.println("firstCheckDigit = "+firstCheckDigit);
       	
       	temp=0;
       	for(int j=0;j<6;j++)
       	{
       		dateOfBirthCharacter=dateOfBirth.charAt(j)-48;
       		secondWeighingCodeChar=secondWeighingCode.charAt(j)-48;
       		temp=temp+dateOfBirthCharacter*secondWeighingCodeChar;
       	}
       	firstCheckDigit = temp%10;
       	secondCheckDigit=temp%10;
       	System.out.println("temp = "+temp);
       	System.out.println("secondCheckDigit = "+secondCheckDigit);
       	
       	temp=0;
       	for(int j=0;j<6;j++)
       	{
       		dateOfExpiryCharacter=dateOfExpiry.charAt(j)-48;
       		thirdWeighingCodeChar=thirdWeighingCode.charAt(j)-48;
       		temp=temp+dateOfExpiryCharacter*thirdWeighingCodeChar;
       	}
       	thirdCheckDigit=temp%10;
       	System.out.println("temp = "+temp);
       	System.out.println("thirdCheckDigit = "+thirdCheckDigit);*/
       	System.out.println("document----------"+documentNumber);
       	firstCheckDigit = checkDigit(documentNumber, false);
       	secondCheckDigit=checkDigit(birthDate, false);
       	thirdCheckDigit=checkDigit(expiryDate,false);
       	
       	overallString=documentNumber+firstCheckDigit+firstOptional+birthDate+secondCheckDigit+expiryDate+
       	thirdCheckDigit+secondOptional;
       	System.out.println(overallString);
       	temp=0;
       	/*for(int j=0;j<50;j++)
       	{
       		overallStringCharacter=overallString.charAt(j);
       		
       		if(overallStringCharacter=='<')
       		{
       			overallStringCharacter=0;	
       		}
       		else if(overallStringCharacter>47&&overallStringCharacter<58)
       		{
       			overallStringCharacter=overallStringCharacter-48;
       		}
       		else
       		{
       			overallStringCharacter=overallStringCharacter-55;
       		}
       		overallWeighingCodeChar=overallWeighingCode.charAt(j)-48;
       		temp=temp+overallStringCharacter*overallWeighingCodeChar;
       	}*/
       	//overallCheckDigit=temp%10;
       	//System.out.println("temp = "+temp);
       	//System.out.println("overallCheckDigit = "+overallCheckDigit);
       	overallCheckDigit = checkDigit(overallString,true);
       	String name=lastName+firstName+middleName;
       	int remainingLength=0;
       	if(name.length()<27)
       	{
       		if(lastName.equals(""))
       		{
       			name=firstName+"<"+middleName;
       			remainingLength=30-name.length();
       		}
       		else
       		{
       			name=lastName+"<<"+firstName+"<"+middleName;
       			remainingLength=30-name.length();
       		}
       		for(int i=0;i<remainingLength;i++)
       		{	
       			name=name+"<";	
       		}
       	}
       	else
       	{
       		if(middleName.equals("")&&lastName.equals(""))
       		{
       			if(firstName.length()>30)
       			{
       				name=firstName.substring(0,30);
       			}
       			else
       			{
       				name=firstName;
       				remainingLength=30-name.length();
       				for(int i=0;i<remainingLength;i++)
       				{
       					name=name+"<";
       				}
       			}
       		}
       		else if(middleName.equals(""))
       		{
       			name=lastName+firstName;
       			if(name.length()>28)
       			{
       				if(lastName.length()>27)
       				{
       					//name=firstName.substring(0, 27)+">>"+lastName.substring(0,1);
       					name=lastName.substring(0,27)+"<<"+firstName.substring(0,1);
       					
       				}
       				else
       				{
       					name=lastName+"<<"+firstName.substring(0,(28-lastName.length()));
       				}
       			}
       			else
       			{
       				name=lastName+"<<"+firstName;
       				remainingLength=30-name.length();
       				for(int i=0;i<remainingLength;i++)
       				{
       					name=name+"<";
       				}
       			}
       		}
       		else if(lastName.equals(""))
       		{
       			name=firstName+middleName;
       			if(name.length()>29)
       			{
       				if(firstName.length()>28)
       				{
       					name=firstName.substring(0, 28)+"<"+middleName.substring(0,1);
       					
       				}
       				else
       				{
       					name=firstName+"<"+middleName.substring(0,(29-firstName.length()));
       				}
       			}
       			else
       			{
       				name=firstName+"<"+middleName;
       				remainingLength=30-name.length();
       				for(int i=0;i<remainingLength;i++)
       				{
       					name=name+"<";
       				}
       			}
       		}else
       		{
       			if(lastName.length()>25)
       			{
       				//name=firstName.substring(0, 27)+">>"+lastName.substring(0,1);
       				name=lastName.substring(0,25)+"<<"+firstName.substring(0,1)+"<"+middleName.substring(0,1);
       				
       			}
       			else
       			{
       				int remainingbits = 28-lastName.length();
       				if(remainingbits<firstName.length())
       				{
       					name=lastName+"<<"+firstName.substring(0,(26-lastName.length()))+"<"+middleName.substring(0,1);
       				}
       				else
       				{
       					name=lastName+"<<"+firstName+"<"+middleName.substring(0,27-(lastName.length()+firstName.length()));
       				}
       				
       				
       				
       			}
       		}
       		
       	}
       	
       	System.out.println(overallCheckDigit);
       	MRZ=documentCode+issuingState+documentNumber+firstCheckDigit+firstOptional+"\n";
       	MRZ=MRZ+birthDate+secondCheckDigit+sex+expiryDate+thirdCheckDigit+nationality+secondOptional+overallCheckDigit+"\n";
       	MRZ=MRZ+name;
       	
       	String mrz1= documentCode+issuingState+documentNumber+firstCheckDigit+firstOptional;
       	String mrz2= birthDate+secondCheckDigit+sex+expiryDate+thirdCheckDigit+nationality+secondOptional+overallCheckDigit;
       	String mrz3 = name;
       	
       	
       	System.out.println(MRZ);
       	
       	
       	return MRZ;
       }
       	
       	private static char checkDigit(String str, boolean preferFillerOverZero) {
       		try {
       			byte[] chars = (str == null) ? new byte[0] : str.getBytes("UTF-8");
       			int[] weights = { 7, 3, 1 };
       			int result = 0;
       			for (int i = 0; i < chars.length; ++i) {
       				result = (result + weights[(i % 3)] * decodeMRZDigit(chars[i])) % 10;
       			}
       			String checkDigitString = Integer.toString(result);
       			if (checkDigitString.length() != 1)
       				throw new IllegalStateException(
       						"Error in computing check digit.");
       			char checkDigit = (char) checkDigitString.getBytes("UTF-8")[0];
       			if ((preferFillerOverZero) && (checkDigit == '0'))
       				checkDigit = '<';
       			return checkDigit;
       		} catch (NumberFormatException nfe) {
       			nfe.printStackTrace();
       			throw new IllegalStateException("Error in computing check digit.");
       		} catch (UnsupportedEncodingException usee) {
       			usee.printStackTrace();
       			throw new IllegalStateException("Error in computing check digit.");
       		} catch (Exception e) {
       			e.printStackTrace();
       			throw new IllegalArgumentException(e.toString());
       		}
       	}

       	private static int decodeMRZDigit(byte ch) throws NumberFormatException {
       		switch (ch) {
       		case 48:
       		case 60:
       			return 0;
       		case 49:
       			return 1;
       		case 50:
       			return 2;
       		case 51:
       			return 3;
       		case 52:
       			return 4;
       		case 53:
       			return 5;
       		case 54:
       			return 6;
       		case 55:
       			return 7;
       		case 56:
       			return 8;
       		case 57:
       			return 9;
       		case 65:
       		case 97:
       			return 10;
       		case 66:
       		case 98:
       			return 11;
       		case 67:
       		case 99:
       			return 12;
       		case 68:
       		case 100:
       			return 13;
       		case 69:
       		case 101:
       			return 14;
       		case 70:
       		case 102:
       			return 15;
       		case 71:
       		case 103:
       			return 16;
       		case 72:
       		case 104:
       			return 17;
       		case 73:
       		case 105:
       			return 18;
       		case 74:
       		case 106:
       			return 19;
       		case 75:
       		case 107:
       			return 20;
       		case 76:
       		case 108:
       			return 21;
       		case 77:
       		case 109:
       			return 22;
       		case 78:
       		case 110:
       			return 23;
       		case 79:
       		case 111:
       			return 24;
       		case 80:
       		case 112:
       			return 25;
       		case 81:
       		case 113:
       			return 26;
       		case 82:
       		case 114:
       			return 27;
       		case 83:
       		case 115:
       			return 28;
       		case 84:
       		case 116:
       			return 29;
       		case 85:
       		case 117:
       			return 30;
       		case 86:
       		case 118:
       			return 31;
       		case 87:
       		case 119:
       			return 32;
       		case 88:
       		case 120:
       			return 33;
       		case 89:
       		case 121:
       			return 34;
       		case 90:
       		case 122:
       			return 35;
       		case 58:
       		case 59:
       		case 61:
       		case 62:
       		case 63:
       		case 64:
       		case 91:
       		case 92:
       		case 93:
       		case 94:
       		case 95:
       		case 96:
       		}
       		throw new NumberFormatException("Could not decode MRZ character " + ch
       				+ " ('" + Character.toString((char) ch) + "')");
       	}

       	/*public static void main(String args[]){
       		createMrz();
       	}*/
       

       

}
