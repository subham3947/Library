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
    <title>Issue</title>
    <script type="text/javascript">
        function get(){

            var x=new XMLHttpRequest();
            var b=document.getElementById("bc").value;
            var url="GetBook.jsp?bcode="+b;

            x.onreadystatechange=function(){
                if(x.readyState==4 && x.status==200){
                    document.getElementById("bname").innerHTML=x.responseText;
                }
            };
            x.open("GET",url,true);
            x.send();
        }

    </script>
    <style type="text/css">
        body{
            background-image: url("bg3.jpg");
            color:  	#e9e2e2;
        }
        .header{
            background-image: url("bg.jpg");
            font-family: Verdana;
            color: #6f5c71;
            font-size: 40px;
            background-repeat: no repeat;
            border-radius: 15px;
            align: center;
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
        .issue{
            font-size: 20px;
        }
        table{
            padding: 5px;
            text-align: left;}

    </style>
</head>
<body>
<%@ page import ="java.sql.*,connection.*,java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<div class="header">
    <div class="logo">
        <img src="clogo.jpg">
    </div>
    <center>Government College of Engineering & Textile Technology,Berhampore</center>
</div><br>
<center><u><h2>Issue</h2></u></center>
<%
    try{
        Connection con=connector.connect();
        String card=(String)session.getAttribute("sescard");
        String year=(String)session.getAttribute("sesyear");
        String sql="select * from "+year+"yr where card=?";
        PreparedStatement st=con.prepareStatement(sql);
        st.setString(1,card);
        ResultSet rs=st.executeQuery();
        while(rs.next())
        {
%><center>
    <div class="issue">
        <form action="issue.jsp" method="post" name="frm">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><%=rs.getString("Name") %></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td><%=rs.getString("Department")%></td>
                </tr>
                <tr>
                    <td>University Roll No.:</td>
                    <td><%=rs.getString("Roll")%></td>
                </tr>
                <tr>
                    <td>Enter Book Code:</td>
                    <td><input type="text" name="bcode" id="bc" onkeypress="get()"></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>
            <div id="bname"></div>
        </form>

    </div>
</center><%
        }

        String bc=request.getParameter("bcode");
        String sql1="select * from books where BookCode=?";
        PreparedStatement st1=con.prepareStatement(sql1);
        st1.setString(1,bc);
        ResultSet rs1=st1.executeQuery();
        while(rs1.next())
        {
            String bname=rs1.getString(2);
            Date date=new Date();
            DateFormat outputFormatter = new SimpleDateFormat("dd/MM/yyyy");
            String di = outputFormatter.format(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.MONTH, 1); // add 30 days
            date = cal.getTime();
            String dr = outputFormatter.format(date);
            System.out.print("till here");
            int cpy=Integer.parseInt(rs1.getString(7));

            String ncpy=Integer.toString(--cpy);
            System.out.print(ncpy);
            String sql2="update books set CopiesAvailable=? where BookCode=?";
            PreparedStatement st2=con.prepareStatement(sql2);
            st2.setString(1,ncpy);
            st2.setString(2,bc);
            st2.executeUpdate();
            String sql3="update "+year+"yr set BookCode=?,Book=?,DateofIssue=?,DateofReturn=? where Card=?";
            PreparedStatement st3=con.prepareStatement(sql3);
            st3.setString(1, bc);
            st3.setString(2, bname);
            st3.setString(3, di);
            st3.setString(4, dr);
            st3.setString(5, card);
            st3.executeUpdate();
            request.setAttribute("errorMessage", "Book Successfully Issued");
            RequestDispatcher rd = request.getRequestDispatcher("admindata.jsp");
            rd.forward(request,response);
        }



    }catch(Exception e)
    {
        request.setAttribute("errorMessage", "Book Not Issued");
        out.println("Error!");
    }



%>
</body>
</html>