<%--
  Created by IntelliJ IDEA.
  User: nakul
  Date: 4/28/17
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Students Page</title>
    <style type="text/css">
        body{
            background-image: url("bg4.jpg");
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
        #butt{
            background-color:#d92626;
            font-size: 15px;
            border: none;
            color: #fff;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
        }
        .details{
            font-size:20px;}
        .bdetails
        {
            font-size:20px;}
    </style>
</head>
<body>
<div class="header">
    <div class="logo">
        <img src="clogo.jpg">
    </div>
    <center>Government College of Engineering & Textile Technology,Berhampore</center>
</div><br>
<%@ page import ="java.sql.*,connection.*" %>
<%
    try{
        Connection con=connector.connect();
        String card=request.getParameter("card");
        String year=request.getParameter("year");
        String sql="select * from "+year+"yr where card=?";
        PreparedStatement st=con.prepareStatement(sql);
        st.setString(1,card);
        ResultSet rs=st.executeQuery();
        if(rs.next()){
%>
<center><div class="details">
    <table border="0" cellspacing="1">

        <tbody>
        <tr>
            <td>Name:</td>
            <td><%=rs.getString("Name")%></td>
        </tr>
        <tr>
            <td>Department:</td>
            <td><%=rs.getString("Department")%></td>
        </tr>
        <tr>
            <td>University Roll No.:</td>
            <td><%=rs.getString("Roll")%></td>
        </tr>
        </tbody>
    </table>

</div>
    <br><br>


    <div class="bdetails"><table border="1" cellpadding="1">
        <tbody>
        <tr>
            <td>Sl. No.</td>
            <td>Book Name</td>
            <td>Book Code</td>
            <td>Date of Issue</td>
            <td>Date of Return</td>
        </tr>
        <tr>
            <td>1</td>
            <td><%=rs.getString("Book")%></td>
            <td><%=rs.getString("BookCode")%></td>
            <td><%=rs.getString("DateofIssue")%></td>
            <td><%=rs.getString("DateofReturn")%></td>
        </tr>
        </tbody>
    </table></div>

        <%

        }
else{
%><p style="text-align: center;font-size: 20px;"><b>No records found.Check the details again.</b></p><%
}
	%>	<br>
    <center><a href="index.jsp"><input type="button" value="Close" id="butt"></a></center>

        <%  }catch(Exception e)
        {
        	e.printStackTrace();
        }%>

</body>
</html>