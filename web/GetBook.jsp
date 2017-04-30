<%--
  Created by IntelliJ IDEA.
  User: nakul
  Date: 4/28/17
  Time: 6:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert title here</title>
    <style type="text/css">
        table{
            text-align: center;
            padding: 5px;}
        #butt{
            width: 250px;
            border-radius: 5px;
            background-color: #4CAF50;
            text-align: center;
            cursor: pointer;
            font-size: 20px;}
    </style>
</head>
<body>
<%@ page import="java.sql.*,java.util.*,connection.*" %>
<%
    try{
        Connection con=connector.connect();
        String bcode=request.getParameter("bcode");
        String sql="select BookName,Author from books where BookCode=?";
        PreparedStatement st=con.prepareStatement(sql);
        st.setString(1,bcode);
        ResultSet rs=st.executeQuery();
        if(rs.next()){
%>
Book Name:<font color="black"> <%=rs.getString(1) %></font><br>
Author:<font color="black"> <%=rs.getString(2) %></font><br>
<center><input type="submit" value="Issue" id="butt"></center>
<%}
else
%><font color="red">Sorry. No book found for this code...</font><%

%>

<%}catch(Exception e){
    e.printStackTrace();
}%>


</body>
</html>