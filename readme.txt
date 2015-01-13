1. Copy file JAR ke folder lib tomcat
	- sqljdbc4.jar (untuk keperluan koneksi JSP dengan database SQL Server 2008)
	- commons-io-2.4.jar (keperluan upload file)
	- commons-fileupload-1.2.2.jar (keperluan upload file)
2. Buat 1 database, execute file Project.sql ke database tadi
3. Sesuaikan konfigurasi connect.jsp dengan database yang telah dibuat

Halaman user -> http://localhost:8080/project/index.jsp
Halaman admin -> http://localhost:8080/project/admin/index.jsp