<%--
  Created by IntelliJ IDEA.
  User: nakul
  Date: 4/28/17
  Time: 6:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <style>
        body{
            background-image: url("bg5.jpg");
            background-repeat: no-repeat;
        }
        .header{
            background-image: url("bg.jpg");
            font-family: Verdana;
            color: #6f5c71;
            font-size: 40px;
            background-repeat: no repeat;
            border-radius: 15px;
        }
        img{
            width: 100px;
            height: 80px;
            border-radius: 20px;
            float: left;
            padding-bottom: 15px;
            padding-left: 5px;
            padding-top: 10px;
        }
    </style>
</head>
<body>
<%@ page import ="java.sql.*,connection.*" %>
<div class="header">
    <div class="logo">
        <img src="clogo.jpg">
    </div>
    <center>Government College of Engineering & Textile Technology,Berhampore</center>
</div>
<%
    try{
        Connection con=connector.connect();
        String dept;
        int i=1;
        String str=request.getParameter("dept");
        String sql="select * from books where Category=?";
        PreparedStatement st=con.prepareStatement(sql);
        st.setString(1, str);
        ResultSet rs=st.executeQuery();
        int stm=Integer.parseInt(str);
        switch(stm)
        {
            case 1:
                dept="Mechanical Engineering:-";
                break;
            case 2:
                dept="Computer Science & Engineering:-";
                break;
            case 3:
                dept="Textile Technology:-";
                break;
            case 4:
                dept="Electrical Engineering:-";
                break;
            case 5:
                dept="Physics:-";
                break;
            case 6:
                dept="Chemistry:-";
                break;
            case 7:
                dept="Humanities:-";
                break;
            case 8:
                dept="Mathematics:-";
                break;
            default:
                dept="Incorrect Stream";
                break;
        }
%>
<center>
    <h2><u><%=dept %></u></h2>
    <table border="1">
        <tr>
            <td>Sl.No.</td><td>Subject</td><td>Book Name</td><td>Author</td><td>Book Code</td><td>Total Copies</td><td>Copies Available</td>
        </tr>
        <%
            while(rs.next())
            {
        %>
        <tr>
            <td><%=i %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td><td><%=rs.getString(7) %></td>
        </tr>
        <%
                i++;
            }
        %>
    </table></center>
<%
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }



%>
</body>
</html>