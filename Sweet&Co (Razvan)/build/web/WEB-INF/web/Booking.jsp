<%@page import="DAO.TableDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.Table"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    TableDAO tableDao = TableDAO.getInstance();
    ArrayList<domain.Table> tables = tableDao.getAvailableTables();
%>
<html>
 
</html>