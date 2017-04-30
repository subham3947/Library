<%--
  Created by IntelliJ IDEA.
  User: nakul
  Date: 4/28/17
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrator Page</title>
    <style>
        body{
            background-image: url("bg1.jpg");

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
        #bfrm{
            display: inline-block;
        }
        .button{
            margin-left: 42%;
            width: 250px;
            border-radius: 5px;
            background-color: #4CAF50;
            text-align: center;
            cursor: pointer;
            font-size: 20px;
        }
        #butt{
            width: 250px;
            border-radius: 5px;
            background-color: #4d4d80;
            text-align: center;
            cursor: pointer;
            font-size: 20px;
        }
        #butt1{
            width: 250px;
            border-radius: 5px;
            background-color: #8080ff;
            text-align: center;
            cursor: pointer;
            font-size: 20px;
        }
        table{
            font-size: 20px;
        }
        ul {
            display: inline-block;
            list-style-type: none;
            float:none;
        }
        #logout{
            height: 40px;
            float: right;
            background-color: #f90606;
            font-size: 15px;
            border: none;
            color: #fff;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            width: 100px;
        }
        <%
            String msg=" ";
            try{
                msg=request.getAttribute("errorMessage").toString();
                if(msg==null) {
                    msg="";
                }
            }catch(Exception e){
                out.print(e.getMessage());
            }
        %>
    </style>
    <script type="text/javascript">
        function validate()
        {

            if( document.detail.year.value==="-1")
            {
                alert("Please provide the year");
                document.detail.year.focus();
                return false;
            }
            if(document.detail.card.value===''||isNaN(document.detail.card.value))
            {
                alert("Please provide a valid card no.");
                document.detail.card.focus();
                return false;
            }
            var y=document.detail.year.value;
            window.location.replace("admindata.jsp?year="+y);
        }
        function sub(){
            alert("All records will be removed.Are you sure you want to submit?")
        }
    </script>

</head>
<body>
<div class="header">
    <div class="logo">
        <img src="clogo.jpg">
    </div>
    <center>Government College of Engineering & Textile Technology,Berhampore</center>
</div>
<form action="logout" name="logout"><input type="Submit" value="Log Out" id="logout" ></form>
<br>
<h1 style="color: #1a7a71"><center><u>Welcome Administrator</u></center></h1>
<h2><center>Please provide the details of the student</center></h2>
<form name="detail" action="admindata.jsp" method="POST" onsubmit="return(validate());">
    <center><table border="0" cellpadding="10">
        <tbody>
        <tr>
            <td style="font-size: 20px;"><b>Enter the Card No.:</b></td>
            <td><input type="text" name="card" value="" size="9" />    </td>


            <td style="font-size: 20px;"><b>Year:</b></td>
            &nbsp <td><select name="year">
            <option value="-1">Please select year </option>
            <option value="1">1st year </option>
            <option value="2">2nd year</option>
            <option value="3">3rd year</option>
            <option value="4">4th year</option>
        </select>    </td>
        </tr>

        </tbody>
    </table></center><br>
    <input type="submit" value="View Details" name="view" class="button"/>
</form>
<center><h3><%=msg %></h3></center>
</form>
<%@ page import ="java.sql.*,connection.*" %>
<%
    try{
        Connection con=connector.connect();
        String card=request.getParameter("card");
        String year=request.getParameter("year");
        session.setAttribute("sescard", card);
        session.setAttribute("sesyear", year);
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
    </table></div><br>

    <form name="issue" action="issue.jsp" id="bfrm" ><input type="submit" value="Issue" name="iss" id="butt" /></form>&nbsp; &nbsp;
    <form name="submit" action="submit.jsp" id="bfrm" onsubmit="return(sub());"><input type="submit" value="Submit" name="subm" id="butt1" /></form>

    <%
        String bc=rs.getString("BookCode");
        session.setAttribute("sescode", bc);%>

</center><%

}
else{
%><p style="text-align: center;font-size: 20px;"><b>No records found.Check the details again.</b></p><%
    }
%>
<%  }catch(Exception e)
{
    e.printStackTrace();
}%>





</body>
</html>
