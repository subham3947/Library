<%--
  Created by IntelliJ IDEA.
  User: nakul
  Date: 4/28/17
  Time: 6:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Submit</title>
</head>
<body>
<%@ page import ="java.sql.*,connection.*" %>
<%
    try{
        Connection con=connector.connect();
        String bc=null;
        String blank="---";
        String card=(String)session.getAttribute("sescard");
        String year=(String)session.getAttribute("sesyear");
        bc=(String)session.getAttribute("sescode");
        System.out.println(bc);
        if(bc.equals(blank))
        {
            request.setAttribute("errorMessage", "Submission cannot be done!!!");
            System.out.println(bc);
        }
        else
        {

            String sql="update "+year+"yr set BookCode=?,Book=?,DateofIssue=?,DateofReturn=? where card=?";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,blank);
            st.setString(2,blank);
            st.setString(3,blank);
            st.setString(4,blank);
            st.setString(5,card);
            st.executeUpdate();
            String sql1="select * from books where BookCode=?";
            PreparedStatement st1=con.prepareStatement(sql1);
            st1.setString(1,bc);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next())
            {
                int cpy=Integer.parseInt(rs1.getString(7));
                String ncpy=Integer.toString(++cpy);
                String sql2="update books set CopiesAvailable=? where BookCode=?";
                PreparedStatement st2=con.prepareStatement(sql2);
                st2.setString(1,ncpy);
                st2.setString(2,bc);
                st2.executeUpdate();
                out.println(ncpy);
                request.setAttribute("errorMessage", "Book Successfully Submitted.");
            }
        }

    }
    catch(Exception e){
        e.printStackTrace();
    }
    finally{
        RequestDispatcher rd = request.getRequestDispatcher("admindata.jsp");
        rd.forward(request,response);
    }
%>

</body>
</html>
