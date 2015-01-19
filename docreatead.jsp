<%@include file="connect.jsp" %>
<%@page import="com.geekonjava.fileupload.FileUploading"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%
	String username = (String)session.getAttribute("username");
	java.sql.Timestamp sqlNow = new java.sql.Timestamp(new java.util.Date().getTime());	
	String imagepath=config.getServletContext().getRealPath("/")+"img\\upload\\";
	ArrayList<String> imagename = new ArrayList<String>();
		imagename.add("img1");	
	ArrayList<String> dataname = new ArrayList<String>();
		dataname.add("title");
		dataname.add("car");
		dataname.add("city");
		dataname.add("harga_per_jam");
		dataname.add("harga_per_hari");
		dataname.add("harga_per_minggu");
		dataname.add("harga_per_bulan");
		dataname.add("company");
		dataname.add("telepon");
		dataname.add("driver");
		dataname.add("alamat");
	HashMap map = FileUploading.UploadFile(imagepath,dataname,imagename,request);
	String title = (String)map.get("title");
	String kode_kendaraan = (String)map.get("car");
	String kode_provinsi = (String)map.get("city");
	String harga_per_jam = (String)map.get("harga_per_jam");
	String harga_per_hari = (String)map.get("harga_per_hari");
	String harga_per_minggu = (String)map.get("harga_per_minggu");
	String harga_per_bulan = (String)map.get("harga_per_bulan");
	String company = (String)map.get("company");
	String telepon = (String)map.get("telepon");
	String driver = (String)map.get("driver");
	String alamat = (String)map.get("alamat");
	
	if(harga_per_jam.equals(""))harga_per_jam="0";
	if(harga_per_hari.equals(""))harga_per_hari="0";
	if(harga_per_minggu.equals(""))harga_per_minggu="0";
	if(harga_per_bulan.equals(""))harga_per_bulan="0";
	try{
		String query = "INSERT INTO TrIklan VALUES('"+title+"','"+sqlNow+"','"+username+"','"+kode_kendaraan+"','"+kode_provinsi+"',"+harga_per_jam+","+harga_per_hari+","+harga_per_minggu+","+harga_per_bulan+","+driver+",'"+company+"','"+telepon+"','"+alamat+"','"+map.get("img1")+"','"+sqlNow+"',0)";
		String query2 = "INSERT INTO TrNotification(notif_type,username,notification,notif_time,status) VALUES(2,'"+username+"','<b>"+username+"</b> has just posted an advertisement','"+sqlNow+"',0)";
		stmt.executeUpdate(query);
		st.executeUpdate(query2);
		response.sendRedirect("add_rent.jsp?msg=success");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>