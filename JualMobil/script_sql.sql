use db_mobil;

CREATE TABLE user (
	id varchar(60) PRIMARY KEY,
    role varchar(40) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE mobil (
	idMobil varchar(60) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    nomorRangka VARCHAR(100) NOT NULL,
    nomorMesin VARCHAR(100) NOT NULL,
    platNomor VARCHAR(100) NOT NULL,
    kapasitasMesin double NOT NULL,
    ketersediaan INT NOT NULL DEFAULT 1,
    tipe VARCHAR(100) NOT NULL,
    harga double NOT NULL,
    warna VARCHAR(100) NOT NULL,
    odoMeter INT NOT NULL DEFAULT 0
);

CREATE TABLE penjualan (
	idPenjualan varchar(60) PRIMARY KEY,
    idSales VARCHAR(60) NOT NULL,
    idMobil VARCHAR(60) NOT NULL,
    tanggal date NOT NULL
);