import java.sql.*;
class OracleCon{
public static void main(String args[]){
try{
Class.forName("oracle.jdbc.driver.OracleDriver");

/*Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@10.226.2.113:2020:ESAMUDRA","DGS","DGS");*/

/*Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@10.226.2.113:2020:ESAMUDRA","DGS_SID","DGS_SID");*/
Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@10.226.70.12:2020:ESAMUDRA","DGS_SID","DGS_SID");
Statement stmt=con.createStatement();

//ResultSet rs=stmt.executeQuery("select VSFRR_FIRST_NAME,VSFRR_SUR_NAME,max(length(VSFRR_FIRST_NAME)) as lengthS from DGS.v_m_seafarer where vsfrr_indos_no = 'SR_N0001' group by VSFRR_FIRST_NAME,VSFRR_SUR_NAME order by lengthS desc");
ResultSet rs=stmt.executeQuery("select * from DGS.v_m_seafarer where vsfrr_indos_no='13EL1982'");
//ResultSet rs=stmt.executeQuery("select * from DGS.v_m_seafarer where vsfrr_pk='42312'");

//ResultSet rs = stmt.executeQuery("SELECT DGS.F_SID_USER_PSWRD_VALIDATE ('SR_N0001' , 'SR_N00011')  OUTPUT  FROM DUAL");
//ps=con.prepareStatement("SELECT DGS.F_SID_USER_PSWRD_VALIDATE ('SR_N0001' , 'SR_N00011')  OUTPUT  FROM DUAL");

//ResultSet rs1=stmt.executeQuery("select a.1stname,b.vcdc_expr_date,b.vcdc_issue_date,a.vsfrr_indos_no from DGS.v_m_seafarer a ,DGS.v_m_cdc b where a.vsfrr_pk=b.vcdc_sfrr_pk");

//ResultSet rs1=stmt.executeQuery("SELECT VSFRR_FIRST_NAME||' '||VSFRR_MIDDLE_NAME||' '||VSFRR_SUR_NAME FROM DGS.V_M_SEAFARER WHERE VSFRR_INDOS_NO ='03GL1956'");



    

ResultSetMetaData rsmd = rs.getMetaData();
int columnCount = rsmd.getColumnCount();
while(rs.next())
{
for(int i=1;i<=columnCount;i++)
{
	String columnValue = rs.getString(i);
	System.out.println(columnValue + " ----- " + rsmd.getColumnName(i));
	//System.out.println(rsmd.getColumnName(i)+"--------------"+rsmd.getColumnDisplaySize(i)+"-----------------"+rsmd.getColumnTypeName(i));
}
}
//int rs1=stmt.executeUpdate("update DGS.v_m_seafarer a set a.vsfrr_dob='1960-04-24 00:00:00' where a.vsfrr_indos_no='IND_04'");
System.out.println("innn");
/*while(rs.next())
{
	System.out.println("dfgbdhg-------"+rs.getString(1));
	//System.out.println("dfgbdhg-------"+rs.getString(2));
	//System.out.println("dfgbdhg-------"+rs.getString(3));
	//System.out.println("dfgbdhg-------"+rs.getString(4));
	//System.out.println("");
	//System.out.println("--"+rs.getString("user_password"));
	//System.out.println("--"+rs.getString("VSFRR_FIRST_NAME"));
	//System.out.println("--"+rs.getString("VSFRR_SUR_NAME"));
	//System.out.println(rs.getString("VCDC_NO"));482998
	
}*/

con.close();

}catch(Exception e){ System.out.println(e);}

}
}