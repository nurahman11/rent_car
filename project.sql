CREATE DATABASE test 
GO 

USE test
GO 

IF OBJECT_ID ('dbo.TrNotification') IS NOT NULL
	DROP TABLE dbo.TrNotification
GO

CREATE TABLE dbo.TrNotification
	(
	notif_id     INT IDENTITY NOT NULL,
	notif_type   INT NOT NULL,
	username     VARCHAR (50),
	notification VARCHAR (255),
	notif_time   DATETIME,
	status       INT,
	PRIMARY KEY (notif_id)
	)
GO

IF OBJECT_ID ('dbo.TrIklan') IS NOT NULL
	DROP TABLE dbo.TrIklan
GO

CREATE TABLE dbo.TrIklan
	(
	kode_iklan            INT IDENTITY NOT NULL,
	judul                 VARCHAR (100) NOT NULL,
	tanggal_post          DATETIME NOT NULL,
	username              VARCHAR (50) NOT NULL,
	kode_kendaraan        VARCHAR (50) NOT NULL,
	kode_provinsi         VARCHAR (50) NOT NULL,
	harga_sewa_per_jam    INT,
	harga_sewa_per_hari   INT,
	harga_sewa_per_minggu INT,
	harga_sewa_per_bulan  INT,
	include_driver        INT,
	company               VARCHAR (50),
	telepon               VARCHAR (50),
	alamat                VARCHAR (500),
	gambar                VARCHAR (255),
	expired               DATETIME NOT NULL,
	status                INT
	)
GO

IF OBJECT_ID ('dbo.MsProvinsi') IS NOT NULL
	DROP TABLE dbo.MsProvinsi
GO

CREATE TABLE dbo.MsProvinsi
	(
	kode_provinsi VARCHAR (50) NOT NULL,
	nama_provinsi VARCHAR (100) NOT NULL,
	PRIMARY KEY (kode_provinsi)
	)
GO

IF OBJECT_ID ('dbo.MsPaket') IS NOT NULL
	DROP TABLE dbo.MsPaket
GO

CREATE TABLE dbo.MsPaket
	(
	kode_paket  VARCHAR (50) NOT NULL,
	nama_paket  VARCHAR (50) NOT NULL,
	harga       INT NOT NULL,
	max_posting INT NOT NULL,
	deskripsi   VARCHAR (500),
	order_no    INT,
	PRIMARY KEY (kode_paket)
	)
GO

IF OBJECT_ID ('dbo.MsNotificationType') IS NOT NULL
	DROP TABLE dbo.MsNotificationType
GO

CREATE TABLE dbo.MsNotificationType
	(
	notif_type_id INT NOT NULL,
	notif_type    VARCHAR (50),
	PRIMARY KEY (notif_type_id)
	)
GO

IF OBJECT_ID ('dbo.MsKendaraan') IS NOT NULL
	DROP TABLE dbo.MsKendaraan
GO

CREATE TABLE dbo.MsKendaraan
	(
	kode_kendaraan       VARCHAR (50) NOT NULL,
	nama_kendaraan       VARCHAR (50) NOT NULL,
	kode_jenis_kendaraan VARCHAR (50) NOT NULL,
	kapasitas            INT,
	transmisi            CHAR (2),
	status               INT,
	PRIMARY KEY (kode_kendaraan)
	)
GO

IF OBJECT_ID ('dbo.MsJenisKendaraan') IS NOT NULL
	DROP TABLE dbo.MsJenisKendaraan
GO

CREATE TABLE dbo.MsJenisKendaraan
	(
	kode_jenis_kendaraan VARCHAR (50) NOT NULL,
	nama_jenis_kendaraan VARCHAR (50) NOT NULL,
	PRIMARY KEY (kode_jenis_kendaraan)
	)
GO

IF OBJECT_ID ('dbo.MsCustomer') IS NOT NULL
	DROP TABLE dbo.MsCustomer
GO

CREATE TABLE dbo.MsCustomer
	(
	username       VARCHAR (50) NOT NULL,
	password       VARCHAR (50) NOT NULL,
	nama           VARCHAR (100) NOT NULL,
	email          VARCHAR (50) NOT NULL,
	kode_paket     VARCHAR (50),
	gender         CHAR (1) NOT NULL,
	umur           INT,
	role           VARCHAR (10),
	tanggal_join   DATETIME,
	status         INT,
	company        VARCHAR (50),
	bank           VARCHAR (50),
	account_number VARCHAR (50),
	PRIMARY KEY (username)
	)
GO

IF OBJECT_ID ('dbo.MsBank') IS NOT NULL
	DROP TABLE dbo.MsBank
GO

CREATE TABLE dbo.MsBank
	(
	kode_bank VARCHAR (50) NOT NULL,
	nama_bank VARCHAR (50),
	PRIMARY KEY (kode_bank)
	)
GO

IF OBJECT_ID ('dbo.Feedback') IS NOT NULL
	DROP TABLE dbo.Feedback
GO

CREATE TABLE dbo.Feedback
	(
	name    VARCHAR (50) NOT NULL,
	email   VARCHAR (50),
	message TEXT
	)
GO

INSERT INTO dbo.MsCustomer (username, password, nama, email, kode_paket, gender, umur, role, tanggal_join, status, company, bank, account_number)
VALUES ('admin', 'admin', 'admin', 'admin', 'PRM', 'M', 22, 'admin', '2015-01-18 18:49:40.6', 1, 'admin', 'admin', 'admin')
GO

INSERT INTO dbo.MsBank (kode_bank, nama_bank)
VALUES ('BCA', 'BCA')
GO

INSERT INTO dbo.MsBank (kode_bank, nama_bank)
VALUES ('BNI', 'BNI')
GO

INSERT INTO dbo.MsBank (kode_bank, nama_bank)
VALUES ('BRI', 'BRI')
GO

INSERT INTO dbo.MsBank (kode_bank, nama_bank)
VALUES ('Mandiri', 'Mandiri')
GO

INSERT INTO dbo.MsJenisKendaraan (kode_jenis_kendaraan, nama_jenis_kendaraan)
VALUES ('MNV', 'Mini Van')
GO

INSERT INTO dbo.MsJenisKendaraan (kode_jenis_kendaraan, nama_jenis_kendaraan)
VALUES ('MPV', 'MPV')
GO

INSERT INTO dbo.MsJenisKendaraan (kode_jenis_kendaraan, nama_jenis_kendaraan)
VALUES ('SPRT', 'Sport')
GO

INSERT INTO dbo.MsJenisKendaraan (kode_jenis_kendaraan, nama_jenis_kendaraan)
VALUES ('SUV', 'SUV')
GO

INSERT INTO dbo.MsKendaraan (kode_kendaraan, nama_kendaraan, kode_jenis_kendaraan, kapasitas, transmisi, status)
VALUES ('Avanza', 'Toyota Avanza Veloz', 'MPV', 8, 'AT', 1)
GO

INSERT INTO dbo.MsKendaraan (kode_kendaraan, nama_kendaraan, kode_jenis_kendaraan, kapasitas, transmisi, status)
VALUES ('Fortuner', 'Toyota Fortuner', 'SUV', 5, 'MT', 1)
GO

INSERT INTO dbo.MsKendaraan (kode_kendaraan, nama_kendaraan, kode_jenis_kendaraan, kapasitas, transmisi, status)
VALUES ('Terios', 'Daihatsu Terios', 'SUV', 6, 'MT', 1)
GO

INSERT INTO dbo.MsKendaraan (kode_kendaraan, nama_kendaraan, kode_jenis_kendaraan, kapasitas, transmisi, status)
VALUES ('Xenia', 'Daihatsu Xenia', 'MPV', 10, 'AT', 1)
GO

INSERT INTO dbo.MsNotificationType (notif_type_id, notif_type)
VALUES (1, 'Register')
GO

INSERT INTO dbo.MsNotificationType (notif_type_id, notif_type)
VALUES (2, 'Post Advertisement')
GO

INSERT INTO dbo.MsNotificationType (notif_type_id, notif_type)
VALUES (3, 'Change Package')
GO

INSERT INTO dbo.MsPaket (kode_paket, nama_paket, harga, max_posting, deskripsi, order_no)
VALUES ('PRM', 'Premium', 500000, 5, 'Deskripsi', 2)
GO

INSERT INTO dbo.MsPaket (kode_paket, nama_paket, harga, max_posting, deskripsi, order_no)
VALUES ('PRO', 'Pro', 1000000, 10, 'Deskripsi', 3)
GO

INSERT INTO dbo.MsPaket (kode_paket, nama_paket, harga, max_posting, deskripsi, order_no)
VALUES ('REG', 'Reguler', 300000, 1, 'Deskripsi', 1)
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('1', 'Bali')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('10', 'Jawa Timur')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('11', 'Kalimantan Barat')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('12', 'Kalimantan Selatan')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('13', 'Kalimantan Tengah')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('14', 'Kalimantan Timur')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('15', 'Kepulauan Bangka Belitung')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('16', 'Kepulauan Riau')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('17', 'Lampung')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('18', 'Luar Negeri')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('19', 'Maluku')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('2', 'Banten')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('20', 'Maluku Utara')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('21', 'Nanggroe Aceh Darussalam')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('22', 'Nusa Tenggara Barat')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('23', 'Nusa Tenggara Timur')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('24', 'Papua')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('25', 'Papua Barat')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('26', 'Riau')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('27', 'Seluruh')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('28', 'Sulawesi Barat')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('29', 'Sulawesi Selatan')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('3', 'Bengkulu')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('30', 'Sulawesi Tengah')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('31', 'Sulawesi Tenggara')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('32', 'Sulawesi Utara')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('33', 'Sumatera Barat')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('34', 'Sumatera Selatan')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('35', 'Sumatera Utara')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('4', 'DI Yogyakarta')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('5', 'DKI Jakarta')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('6', 'Gorontalo')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('7', 'Jambi')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('8', 'Jawa Barat')
GO

INSERT INTO dbo.MsProvinsi (kode_provinsi, nama_provinsi)
VALUES ('9', 'Jawa Tengah')
GO

