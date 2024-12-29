<%-- 
    Document   : sidebar
    Created on : 13 Dec 2024, 10.22.04
    Author     : Aqila Hasya Nafisah
--%>

<%@page import="com.mycompany.jualmobil.beans.Mobil"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.jualmobil.beans.Penjualan"%>
<%@page import="com.mycompany.jualmobil.dao.PenjualanDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Poppins', sans-serif;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container-regist {
                display: flex;
                width: 100%;
                height: 100%;
                position: relative;
                overflow: hidden;
            }
            .left-section {
                background-color: #1D1A4A;
                color: white;
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                height: 100%;
                width: 150px;
                font-size: 30px;
            }

            .left-section span {
                color: #EC5A7E;
            }
            .left-section p{
                margin: 0;
                text-shadow: 2px 4px 5px rgba(0, 0, 0, 0.122);
            }
            .title {
                width: 250px;
                display: flex;
                justify-content: center;
                margin-top: 40px;
                margin-left: 20px;
                margin-bottom: 50px;
            }

            .right-section {
                overflow-y: auto; 
                position: absolute;
                background-color: white;
                right: 0;
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100%;
                width: 80%;
                box-shadow: -10px 0px 10px rgba(0, 0, 0, 0.142);
                border-radius: 30px 0 0 30px;
            }
          
             .top-bar {
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                width: 100%;
                height: 100px;
                align-self: flex-start;
                display: flex;
                align-items: center;
            }
            
            .search-bar {
                align-items: center;
                justify-content: center;
                height: 100%;
                width: 100%;
                display: flex;
            }
            
            .form{
                position: relative;
                width: 400px;
                height: 55px;
            }

            .form .search-icon{
                position: absolute;
                top: 15px;
                left: 15px;
                color: #9ca3af;
            }

            .form span{
                position: absolute;
                right: 15px;
                top: 13px;
                padding: 2px;
                border-left: 1px solid #d1d5db;

            }

            .left-pan{
                padding-left: 7px;
                position: absolute;
            }

            .left-pan svg{
               padding-left: 10px;
            }

            .form-input{
                height: 55px;
                text-indent: 33px;
                border-radius: 10px;
            }

            .form-input:focus{
                box-shadow: none;
                border: none;
            }
            
            .form-control{
                width: 100%;
            }
            
            .logo {
                width: 50px; 
                height: 50px;
                background-color: #D9D9D9; 
                border-radius: 50%;
            }
            
            .nav-link {
                color: inherit;
            }
            .nav-link:hover {
                color: inherit; 
                text-decoration: none; 
            }

            .buttons {
                width: 310px;
                font-size: 20px;
            }
            
            .buttons li:hover{
                color : white;
                background-color: #17143E;
            }
            
            .nav-item {
                height: 63px;
                padding-top: 13px;
            }
            
            .buttons hr{
                margin-left: 20px;
                width: 230px;
                align-self: center;
            }
            
            .buttons svg{
                margin-left: 15px;
                margin-right: 37px;
            }
            
            .nav-item a{
                font-size: 14px;
            }

           
            .profile {
                display: flex;  
                margin-right: 40px;
                text-decoration: none;
            }
            
            .dropdown {
                color: inherit;
            }
            
            .dropdown-menu {
                text-decoration: none;
                color: black;
                width: 200px;
                padding: 10px;
            }
            
            .dropdown-toggle::after {
                display: none !important; 
            }
            
            .user-info span{
                font-size: 18px;
            }
            
            .user-info p{
                font-weight: 400;
                font-size: 14px;
            }

            .left-column, .right-column {
                display: flex;
                flex-direction: column; 
                gap: 8px;
            }

            .left-column span, .right-column span {
                font-weight: bold;
                color: #000;
            }

            .Acontainer {
                display: flex;
                margin-left: 30px;
                margin-top: 40px;
                align-items: center;
                margin-right: 30px;
            }
            .text {
                width: 80%;
            }
            .buttons {
                display: flex;
                gap: 10px; 
            }
            .button {
                background-color: #5A3EAA; 
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                margin-left: 10px;
            }
            .button:hover {
                background-color: #473085;
            }
            .button:focus {
                outline: none;
            }
            
            .Bcontainer {
                width: 95%;
                margin: auto;
                overflow-x: auto; 
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            
            thead {
                background-color: #f5f5f5;
            }
                        
            th, td {
                padding: 15px;
                text-align: center;
                border: none;
            }
            th {
                font-weight: bold;
            }
            
            thead th{
                text-align: center;
                font-weight: bold;
                background-color: #f5f5f5; 
            }
            
            tbody td {
                text-align: center;
                vertical-align: middle;
            }
            
            tbody tr {
                background-color: #fff;
            }
            tbody tr:hover {
                background-color: #f1f1f1;
            }
            .image-container {
                text-align: center;
            }
            .image-container img {
                width: 150px;
                height: auto;
            }
            .scrollable-section {
                height: 400px;
                overflow-y: auto;
                border: 1px solid #ddd;
            }
            
            /* Menyamakan tinggi dan posisi gambar */
            .custom-table td img {
                width: 120px;
                height: auto;
                display: block;
                margin: 0 auto;
            }

            /* Menjaga semua sel tabel agar sejajar secara vertikal */
            .custom-table td, .custom-table th {
                text-align: center;
                vertical-align: middle; /* Menjaga semua konten sel sejajar */
            }

            /* Tambahkan jarak antar baris tabel */
            .custom-table tr {
                border: 1px solid #ddd;
            }
            
            .custom-table {
                display: none; /* Sembunyikan tabel secara default */
            }

            .empty-message {
                text-align: center;
                color: #888;
                margin-top: 20px;
            }

            .car-img {
                width: 120px;
                height: auto;
            }

            .vertical-middle {
                vertical-align: middle;
            }
            
            .custom-modal-size {
                max-width: 1000px; /* Atur lebar modal sesuai kebutuhan */
            }
            
            .custom-textarea {
                background-color: #e7eef7;
                border-color: #d5dfeb;
                width: 100%;
                height: 150px;
                padding: 10px;
                font-family: Arial, sans-serif;
                font-size: 14px;
                white-space: pre-line;  /* Mempertahankan spasi dan baris baru */
                pointer-events: none;   /* Menonaktifkan interaksi dengan textarea */
                overflow-y: scroll;     /* Menambahkan scrollbar vertikal saat konten melebihi tinggi */
                resize: none;           /* Menonaktifkan resize (ukuran ulang) */
            }
            .btn-primary {
                background-color: #3b72c5;
                border: none;
                padding: 10px 20px;
                font-weight: bold;
            }
            .btn-primary:hover {
                background-color: #315a99;
            }
        </style>
    </head>
    <body>
        <div class="container-regist">
        <div class="left-section">
            <div class="title d-flex justify-content-around">
                <p class="logo "></p>
                <p>WTSMobil</p>
            </div>
            <div class="buttons">
                <ul class="nav  flex-column mb-auto">
                    <%
                        String user = request.getParameter("user"); 
                        String src;
                    %>
                    <li class="nav-item">
                        <a href="mobilController?action=tampil&source=login&user=<%=user %>" class="nav-link active">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20.8333 19.7916V10.9374C20.8333 10.7757 20.7957 10.6162 20.7233 10.4716C20.651 10.3269 20.546 10.2011 20.4167 10.1041L13.125 4.63534C12.9447 4.5001 12.7254 4.427 12.5 4.427C12.2746 4.427 12.0553 4.5001 11.875 4.63534L4.58332 10.1041C4.45395 10.2011 4.34895 10.3269 4.27663 10.4716C4.20431 10.6162 4.16666 10.7757 4.16666 10.9374V19.7916C4.16666 20.0679 4.2764 20.3328 4.47175 20.5282C4.6671 20.7235 4.93206 20.8333 5.20832 20.8333H9.37499C9.65126 20.8333 9.91621 20.7235 10.1116 20.5282C10.3069 20.3328 10.4167 20.0679 10.4167 19.7916V16.6666C10.4167 16.3903 10.5264 16.1254 10.7218 15.93C10.9171 15.7347 11.1821 15.6249 11.4583 15.6249H13.5417C13.8179 15.6249 14.0829 15.7347 14.2782 15.93C14.4736 16.1254 14.5833 16.3903 14.5833 16.6666V19.7916C14.5833 20.0679 14.6931 20.3328 14.8884 20.5282C15.0838 20.7235 15.3487 20.8333 15.625 20.8333H19.7917C20.0679 20.8333 20.3329 20.7235 20.5282 20.5282C20.7236 20.3328 20.8333 20.0679 20.8333 19.7916Z" fill="white" stroke="white" stroke-width="2.08333" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg> 
                            Beranda
                            <hr>
                        </a>
                    </li>
                    <%
                        if ("Petugas".equals(user))  {
                            src = "https://i.pinimg.com/736x/42/ca/a2/42caa25497d797187ba0afc537ee4bfc.jpg";
                    %>
                    <li class="nav-item">
                        <a href="mobilController?action=tampil&source=homepage&user=Petugas" class="nav-link">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9 8V6H15V8H9ZM7 22C6.45 22 5.97933 21.8043 5.588 21.413C5.19667 21.0217 5.00067 20.5507 5 20C4.99933 19.4493 5.19533 18.9787 5.588 18.588C5.98067 18.1973 6.45133 18.0013 7 18C7.54867 17.9987 8.01967 18.1947 8.413 18.588C8.80633 18.9813 9.002 19.452 9 20C8.998 20.548 8.80233 21.019 8.413 21.413C8.02367 21.807 7.55267 22.0027 7 22ZM17 22C16.45 22 15.9793 21.8043 15.588 21.413C15.1967 21.0217 15.0007 20.5507 15 20C14.9993 19.4493 15.1953 18.9787 15.588 18.588C15.9807 18.1973 16.4513 18.0013 17 18C17.5487 17.9987 18.0197 18.1947 18.413 18.588C18.8063 18.9813 19.002 19.452 19 20C18.998 20.548 18.8023 21.019 18.413 21.413C18.0237 21.807 17.5527 22.0027 17 22ZM1 4V2H4.275L8.525 11H15.525L19.425 4H21.7L17.3 11.95C17.1167 12.2833 16.871 12.5417 16.563 12.725C16.255 12.9083 15.9173 13 15.55 13H8.1L7 15H19V17H7C6.25 17 5.679 16.675 5.287 16.025C4.895 15.375 4.88267 14.7167 5.25 14.05L6.6 11.6L3 4H1Z" fill="white"/>
                                </svg>                                
                            Produk 
                            <hr>
                        </a>
                    </li>
                    <%
                        } else {
                            src = "https://i.pinimg.com/736x/09/1e/b6/091eb62c743e1215099789d50c46a698.jpg";
                        }
                    %>
                    <li class="nav-item">
                        <a href="penjualanController?action=tampil&user=<%=user %>" class="nav-link">
                            <svg width="27" height="25" viewBox="0 0 27 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M23.8516 5.85936C23.7391 5.78916 23.6106 5.74875 23.4782 5.74191C23.3458 5.73508 23.2138 5.76205 23.0947 5.8203C18.9023 7.87108 15.9082 6.91014 12.7432 5.89647C9.41406 4.8369 5.97656 3.73827 1.21973 6.06053C1.08836 6.12467 0.977618 6.22439 0.900105 6.34834C0.822591 6.4723 0.781412 6.61551 0.78125 6.7617V18.4736C0.781231 18.6062 0.81494 18.7366 0.879203 18.8525C0.943467 18.9684 1.03617 19.0661 1.14859 19.1363C1.26102 19.2065 1.38946 19.247 1.52183 19.2539C1.65421 19.2608 1.78616 19.2339 1.90527 19.1758C6.09766 17.125 9.0918 18.0859 12.2617 19.0996C14.1406 19.7002 16.0547 20.3125 18.2188 20.3125C19.8877 20.3125 21.708 19.9492 23.7764 18.9394C23.9077 18.8753 24.0185 18.7756 24.096 18.6516C24.1735 18.5277 24.2147 18.3845 24.2148 18.2383V6.52635C24.216 6.39345 24.1833 6.26245 24.1197 6.14574C24.0561 6.02902 23.9639 5.93046 23.8516 5.85936ZM4.6875 14.8437C4.6875 15.0509 4.60519 15.2497 4.45868 15.3962C4.31216 15.5427 4.11345 15.625 3.90625 15.625C3.69905 15.625 3.50034 15.5427 3.35382 15.3962C3.20731 15.2497 3.125 15.0509 3.125 14.8437V8.59373C3.125 8.38653 3.20731 8.18782 3.35382 8.04131C3.50034 7.89479 3.69905 7.81248 3.90625 7.81248C4.11345 7.81248 4.31216 7.89479 4.45868 8.04131C4.60519 8.18782 4.6875 8.38653 4.6875 8.59373V14.8437ZM12.5 15.625C11.8819 15.625 11.2777 15.4417 10.7638 15.0983C10.2499 14.7549 9.8494 14.2669 9.61288 13.6959C9.37635 13.1249 9.31447 12.4965 9.43505 11.8903C9.55562 11.2841 9.85325 10.7273 10.2903 10.2903C10.7273 9.85324 11.2842 9.55561 11.8903 9.43503C12.4965 9.31445 13.1249 9.37634 13.6959 9.61286C14.2669 9.84938 14.755 10.2499 15.0983 10.7638C15.4417 11.2777 15.625 11.8819 15.625 12.5C15.625 13.3288 15.2958 14.1236 14.7097 14.7097C14.1237 15.2957 13.3288 15.625 12.5 15.625ZM21.875 16.4062C21.875 16.6134 21.7927 16.8122 21.6462 16.9587C21.4997 17.1052 21.301 17.1875 21.0938 17.1875C20.8865 17.1875 20.6878 17.1052 20.5413 16.9587C20.3948 16.8122 20.3125 16.6134 20.3125 16.4062V10.1562C20.3125 9.94903 20.3948 9.75032 20.5413 9.60381C20.6878 9.45729 20.8865 9.37498 21.0938 9.37498C21.301 9.37498 21.4997 9.45729 21.6462 9.60381C21.7927 9.75032 21.875 9.94903 21.875 10.1562V16.4062Z" fill="white"/>
                            <line x1="22.2143" y1="15.7142" x2="22.2143" y2="24.7142" stroke="#77C270" stroke-width="3"/>
                            <line x1="26.1429" y1="20.7858" x2="17.1429" y2="20.7858" stroke="#77C270" stroke-width="3"/>
                            </svg>
                            Pencatatan 
                            <hr>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
            <div class="right-section">
                <div class="top-bar">
                    <div class="search-bar">
                        <div class="form">
                            
                        </div>
                    </div>
                    <div class="profile">
                        <!-- Right-side dropdown -->
                         <ul class="navbar-nav ms-auto">
                            <div class="dropdown" style="display: inline-block;">
                                <a href="#" class="dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"
                                    style="outline: none; box-shadow: none; border: none; display: flex; align-items: center;">
                                    <img src=<%=src %> alt="" width="50" height="50" class="rounded-circle me-2"
                                        style="margin-right: 5px;">
                                    <svg class="dropdown-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"
                                        style="margin-left: 0;">
                                        <path d="M16.8583 5.19166L18.3333 6.66666L9.99998 15L1.66665 6.66666L3.14165 5.19166L9.99998 12.05L16.8583 5.19166Z" fill="#939393"/>
                                    </svg>
                                </a>
                                <div class="dropdown-menu" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-custom">
                                      <div class="modal-content" style="height: 100%; width: 100%">
                                        <div class="modal-body modal-body-user text-center">
                                          <div class="mb-3">
                                            <img src=<%=src %> alt="User Avatar" class="rounded-circle" style="width: 80px; height: 80px;">
                                          </div>             
                                          <h5 class="user-info">
                                            <span class="text">Admin</span> 
                                            <p>Sales</p>
                                          </h5>              
                                        </div>
                                      </div>
                                    </div>
                                </div> 
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="Acontainer align-self-xl-stretch">
                    <span class="text">Transaksi</span>
                    <div class="buttons">
                        <button class="button" data-bs-toggle="modal" data-bs-target="#tambahModal">+ Tambah</button>
                        <button class="button" data-bs-toggle="modal" data-bs-target="#rekapModal">Lihat Rekap</button>
                    </div>
                </div>
               
                <!-- Modal Tambah -->
                  <!-- Modal -->
                    <div class="modal fade" id="tambahModal" tabindex="-1" aria-labelledby="tambahModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <!-- Header Modal -->
                                <div class="modal-header">
                                    <h5 class="modal-title fw-bold" id="tambahModalLabel">Tambah Pencatatan Penjualan</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <!-- Body Modal -->
                                <div class="modal-body">
                                    <form action="penjualanController" method="post">
                                        <input type="hidden" name="action" value="tambah">
                                        <!-- Input Tanggal Pembelian -->
                                        <div class="mb-3">
                                            <label for="tanggalPembelian" class="form-label">Tanggal pembelian</label>
                                            <input type="date" class="form-control" id="tanggalPembelian" name="tanggal">
                                        </div>
                                        <div class="mb-3">
                                            <label for="idPenjualan" class="form-label">ID Penjualan</label>
                                            <input type="text" class="form-control" id="idPenjualan" name="idPenjualan">
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="idSales" class="form-label">ID Sales</label>
                                            <input type="text" class="form-control" id="idSales" name="idSales">
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="idMobil" class="form-label">ID Mobil</label>
                                            <input type="text" class="form-control" id="idMobil" name="idMobil">
                                        </div>
                                        
                                        <div class="mb-3">
                                            <label for="harga" class="form-label">Harga</label>
                                            <input type="text" class="form-control" id="harga" name="hargaJual">
                                        </div>  

                                        <!-- Tombol Tambahkan -->
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary">+ Tambahkan</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                 <!-- Modal Lihat Rekap -->
                <div class="modal fade" id="rekapModal" tabindex="-1" aria-labelledby="rekapModalLabel" aria-hidden="true">
                        <div class="modal-dialog custom-modal-size">
                            <div class="modal-content">
                                <!-- Header Modal -->
                                <div class="modal-header">
                                    <h5 class="modal-title" id="rekapModalLabel">Rekapitulasi Penjualan</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <!-- Body Modal -->
                                <div class="modal-body">
                                    <!-- Input Tanggal -->
                                    <form action="penjualanController" method="get">
                                        <input type="hidden" name="action" value="getPenjualan_tanggal">
                                        
                                        <div class="row mb-3">
                                        <div class="col">
                                            <input type="date" id="tanggalMulai" name="tanggalMulai" class="form-control" placeholder="dd/mm/yyyy">
                                        </div>
                                        <div class="col-auto d-flex align-items-center">
                                            <span>—</span>
                                        </div>
                                        <div class="col">
                                            <input type="date" id="tanggalAkhir" name="tanggalAkhir" class="form-control" placeholder="dd/mm/yyyy">
                                        </div>
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Simpan</button>
                                        </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="Bcontainer">
                    <table>
                        <thead>
                            <tr>
                                <th scope="col">ID Penjualan</th>
                                <th scope="col">Tanggal</th>
                                
                                <th scope="col">ID Mobil</th>
                                <th scope="col">Harga</th>
                            </tr>
                        </thead>
                    </table>
                    <div class="scrollable-section">
                        <table>
                            <tbody>
                                <%
                                       List<Penjualan> daftarPenjualan = null;
                                       if (request.getAttribute("daftarPenjualanTanggal")==null) {
                                           daftarPenjualan = (List<Penjualan>) request.getAttribute("daftarPenjualan");
                                        } else {
                                            daftarPenjualan = (List<Penjualan>) request.getAttribute("daftarPenjualanTanggal");
                                        }
                                       if (daftarPenjualan != null) {
                                            for (Penjualan p : daftarPenjualan) {
                                %>
                                <tr>
                                    <td>
                                        <div class="col-1">
                                        <form action="penjualanController" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="<%=p.getIdPenjualan() %>">
                                                <button type="submit" class="btn custom-action-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%=p.getIdPenjualan() %>">
                                                    <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M3 18C2.45 18 1.97933 17.8043 1.588 17.413C1.19667 17.0217 1.00067 16.5507 1 16V3H0V1H5V0H11V1H16V3H15V16C15 16.55 14.8043 17.021 14.413 17.413C14.0217 17.805 13.5507 18.0007 13 18H3ZM13 3H3V16H13V3ZM5 14H7V5H5V14ZM9 14H11V5H9V14Z" fill="#939393"/>
                                                    </svg>                                                
                                                </button>
                                        </form>
                                                           
                                        <div class="d-grid">
                                            <form action="penjualanController" method="get">
                                                <input type="hidden" name="action" value="getPenjualan">
                                                <input type="hidden" name="idPenjualan" value="<%= p.getIdPenjualan() %>">
                                                <button type="submit" class="btn custom-action-btn" data-bs-toggle="modal" data-bs-target="#editModal">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M5 19H6.425L16.2 9.225L14.775 7.8L5 17.575V19ZM3 21L3 16.75L16.2 3.575C16.4 3.39167 16.621 3.25 16.863 3.15C17.105 3.05 17.359 3 17.625 3C17.891 3 18.1493 3.05 18.4 3.15C18.6507 3.25 18.8673 3.4 19.05 3.6L20.425 5C20.625 5.18333 20.771 5.4 20.863 5.65C20.955 5.9 21.0007 6.15 21 6.4C21 6.66667 20.9543 6.921 20.863 7.163C20.7717 7.405 20.6257 7.62567 20.425 7.825L7.25 21H3ZM15.475 8.525L14.775 7.8L16.2 9.225L15.475 8.525Z" fill="#939393"/>
                                                    </svg>                                                
                                                </button>
                                            </form>
                                        </div>
                                        </div>
                                    </td>
                                    
                                    <td><%= p.getIdPenjualan() %></td>
                                    <td><%= p.getTanggal() %></td>
                                    
                                    <td><%= p.getIdMobil() %></td>
                                    <td>Rp <%= String.format("%,.0f", p.getHargaJual()) %></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
                <%
                    Penjualan penjualan = (Penjualan) request.getAttribute("penjualan");
                    Boolean popUpEdit = (Boolean) request.getAttribute("popUpEdit");
                %>
                <!-- Modal Edit -->
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true"
                <% if (Boolean.TRUE.equals(popUpEdit)) { %> aria-modal="true" role="dialog" <% } %>>
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <!-- Header Modal -->
                        <div class="modal-header">
                            <h5 class="modal-title fw-bold" id="editModalLabel">Edit Pencatatan Penjualan</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- Body Modal -->
                        <div class="modal-body">
                        <form action="penjualanController" method="post">
                            <input type="hidden" name="action" value="edit">

                            <!-- Input Tanggal Pembelian -->
                            <div class="mb-3">
                                <label for="tanggal_edit" class="form-label">Tanggal Pembelian</label>
                                <input type="date" class="form-control" value="${penjualan.tanggal}" id="tanggal_edit" name="tanggal_edit" required>
                            </div>

                            <div class="mb-3">
                                <label for="idPenjualan_edit" class="form-label">ID Penjualan</label>
                                <input type="text" class="form-control" value="${penjualan.idPenjualan}" id="idPenjualan_edit" name="idPenjualan_edit" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="idSales_edit" class="form-label">ID Sales</label>
                                <input type="text" class="form-control" value="${penjualan.idSales}" id="idSales_edit" name="idSales_edit" required>
                            </div>

                            <div class="mb-3">
                                <label for="idMobil_edit" class="form-label">ID Mobil</label>
                                <input type="text" class="form-control" value="${penjualan.idMobil}" id="idMobil_edit" name="idMobil_edit" required>
                            </div>

                            <div class="mb-3">
                                <label for="hargaJual_edit" class="form-label">Harga</label>
                                <input type="text" class="form-control" value="<%= (long) penjualan.getHargaJual() %>" id="hargaJual_edit" name="hargaJual_edit" required>
                            </div>

                            <!-- Tombol Simpan -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Simpan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <% if (Boolean.TRUE.equals(popUpEdit)) { %>
    <script>
    // Skrip untuk menampilkan modal jika popUpEdit bernilai true
        document.addEventListener("DOMContentLoaded", function () {
        var editModal = new bootstrap.Modal(document.getElementById('editModal'), {});
        editModal.show();
    });
    </script>
    <% } %>
    
    <!-- Bootstrap JS dan JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </div>
    </body>
</html>