<%-- 
    Document   : addStudent
    Created on : 2015-11-21, 21:12:30
    Author     : 庞宇
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.work.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addStudent</title>
         <style type="text/css">
            *{
                margin:0;
                padding:0;
            }
            body{
                font: 13px/1.6 tahoma,arial,sans-serif;
                color:#c91e26;
                background:#f1f3f5;
            }
              a{
                text-decoration:none;
            }
            a:visited{
                color:#666;
            }

            a:hover{
                color:#c91e26;
            }
            a{
                margin-left:5px;
               
                letter-spacing:1pt;
            }
         
        </style>
    </head>
    <body>
        <%
           String studentId=request.getParameter("id");
           String studentCode=request.getParameter("code");
           String enName=request.getParameter("en");
           String cnName=new String(request.getParameter("cn").getBytes("ISO-8859-1"),"UTF-8");
           
           Connection con=DBConnection.getConnection();
           String sql="insert into student values(?,?,?,?,null)";
        
           PreparedStatement st=con.prepareStatement(sql);
           st.setString(1,studentId);
           st.setString(2,studentCode);
           st.setString(3, enName);
           st.setString(4, cnName);
           st.executeUpdate();
           
           st.close();
           con.close();
           
        %>
        <%="添加成功"%><a href="http://localhost:8080/Work/iframe/content.jsp">返回</a>
    </body>
</html>
