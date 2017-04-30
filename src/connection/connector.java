package connection;

/**
 * Created by nakul on 4/28/17.
 */
    import java.sql.*;
    public class connector {
        static Connection con=null;
        static String driver="com.mysql.jdbc.Driver";
        static String url="jdbc:mysql://localhost:3306/";
        static String user="root";
        static String pass="Works@72";
        public static Connection connect()
        {
            try{
                Class.forName(driver);
                con=DriverManager.getConnection(url,user,pass);
                System.out.println("Connected");

            }
            catch(Exception e)
            {
                System.out.println("Connetion Failed!!!");
                e.printStackTrace();
            }
            return con;


        }

    }
