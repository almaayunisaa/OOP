<%-- 
    Document   : sidebar
    Created on : 13 Dec 2024, 10.22.04
    Author     : Aqila Hasya Nafisah
--%>

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
                overflow-y: auto; /* Bagian kanan scrollable */
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
                color: inherit; /* Keeps the original color */
                text-decoration: none; /* Removes any underline or text decoration */
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
                display: none !important; /* Hide Bootstrap's default caret */
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
                flex-direction: column; /* Stack items vertically */
                gap: 8px; /* Space between rows */
            }

            .left-column span, .right-column span {
                font-weight: bold;
                color: #000; /* Make text bold and black */
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
                gap: 10px; /* Jarak antar tombol */
            }
            .button {
                background-color: #5A3EAA; /* Purple color */
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                margin-left: 10px;
            }
            .button:hover {
                background-color: #473085; /* Darker purple on hover */
            }
            .button:focus {
                outline: none;
            }
            
            .Bcontainer {
                width: 95%;
                margin: auto;
                overflow-x: auto; /* Enable horizontal scrolling */
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
                text-align: left;
                border: none;
            }
            th {
                font-weight: bold;
            }
            
            thead th{
                text-align: center;
                font-weight: bold;
                background-color: #f5f5f5; /* Warna latar belakang header (opsional) */
            }
            
            tbody td {
                text-align: center;
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
                height: 400px; /* Adjust height as needed */
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
                border: 1px solid #ddd;
                height: 200px;
                resize: none;
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
                <p>GATAU EUY</p>
            </div>
            <div class="buttons">
                <ul class="nav  flex-column mb-auto">
                    <li class="nav-item">
                        <a href="Homepage_Sales.jsp" class="nav-link active">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20.8333 19.7916V10.9374C20.8333 10.7757 20.7957 10.6162 20.7233 10.4716C20.651 10.3269 20.546 10.2011 20.4167 10.1041L13.125 4.63534C12.9447 4.5001 12.7254 4.427 12.5 4.427C12.2746 4.427 12.0553 4.5001 11.875 4.63534L4.58332 10.1041C4.45395 10.2011 4.34895 10.3269 4.27663 10.4716C4.20431 10.6162 4.16666 10.7757 4.16666 10.9374V19.7916C4.16666 20.0679 4.2764 20.3328 4.47175 20.5282C4.6671 20.7235 4.93206 20.8333 5.20832 20.8333H9.37499C9.65126 20.8333 9.91621 20.7235 10.1116 20.5282C10.3069 20.3328 10.4167 20.0679 10.4167 19.7916V16.6666C10.4167 16.3903 10.5264 16.1254 10.7218 15.93C10.9171 15.7347 11.1821 15.6249 11.4583 15.6249H13.5417C13.8179 15.6249 14.0829 15.7347 14.2782 15.93C14.4736 16.1254 14.5833 16.3903 14.5833 16.6666V19.7916C14.5833 20.0679 14.6931 20.3328 14.8884 20.5282C15.0838 20.7235 15.3487 20.8333 15.625 20.8333H19.7917C20.0679 20.8333 20.3329 20.7235 20.5282 20.5282C20.7236 20.3328 20.8333 20.0679 20.8333 19.7916Z" fill="white" stroke="white" stroke-width="2.08333" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg> 
                            Beranda
                            <hr>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="pencatatan.jsp" class="nav-link">
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
                            <div class="search-icon">
                                <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M16.1458 14.5834H15.3229L15.0312 14.3021C15.6822 13.5458 16.158 12.655 16.4245 11.6934C16.691 10.7318 16.7417 9.72311 16.5729 8.73962C16.0833 5.84379 13.6667 3.53128 10.75 3.17712C9.7246 3.04739 8.68311 3.15396 7.70523 3.48867C6.72735 3.82337 5.839 4.37735 5.10815 5.10819C4.37731 5.83904 3.82334 6.72739 3.48863 7.70527C3.15393 8.68315 3.04736 9.72463 3.17708 10.75C3.53125 13.6667 5.84375 16.0834 8.73958 16.573C9.72307 16.7418 10.7317 16.6911 11.6933 16.4246C12.655 16.158 13.5458 15.6823 14.3021 15.0313L14.5833 15.323V16.1459L19.0104 20.573C19.4375 21 20.1354 21 20.5625 20.573C20.9896 20.1459 20.9896 19.448 20.5625 19.0209L16.1458 14.5834ZM9.89583 14.5834C7.30208 14.5834 5.20833 12.4896 5.20833 9.89587C5.20833 7.30212 7.30208 5.20837 9.89583 5.20837C12.4896 5.20837 14.5833 7.30212 14.5833 9.89587C14.5833 12.4896 12.4896 14.5834 9.89583 14.5834Z" fill="#757575"/>
                                </svg>
                            </div>
                            <input type="text" class="form-control form-input" placeholder="Search anything...">
                            <span class="left-pan">
                                <svg width="30" height="30" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M19.7917 3.125H5.20834C3.73543 3.125 2.99897 3.125 2.54168 3.55417C2.08439 3.98333 2.08334 4.675 2.08334 6.05729V6.77604C2.08334 7.85625 2.08334 8.39687 2.35418 8.84479C2.62501 9.29271 3.11772 9.57187 4.10626 10.1281L7.14064 11.8365C7.80313 12.2094 8.13543 12.3958 8.37293 12.6021C8.86668 13.0302 9.17084 13.5344 9.30834 14.1542C9.37501 14.45 9.37501 14.7979 9.37501 15.4927V18.274C9.37501 19.2208 9.37501 19.6948 9.63751 20.0635C9.90001 20.4333 10.3667 20.6156 11.2979 20.9802C13.2552 21.7448 14.2333 22.1271 14.9292 21.6917C15.625 21.2562 15.625 20.2625 15.625 18.2729V15.4917C15.625 14.7979 15.625 14.45 15.6917 14.1531C15.8225 13.546 16.152 12.9998 16.6281 12.601C16.8646 12.3958 17.1969 12.2094 17.8594 11.8354L20.8938 10.1271C21.8813 9.57188 22.3761 9.29375 22.6458 8.84583C22.9167 8.39792 22.9167 7.85625 22.9167 6.775V6.05625C22.9167 4.675 22.9167 3.98333 22.4583 3.55417C22.0021 3.125 21.2656 3.125 19.7917 3.125Z" fill="#757575"/>
                                </svg>
                            </span>
                        </div>
                    </div>
                    <div class="profile">
                        <!-- Right-side dropdown -->
                         <ul class="navbar-nav ms-auto">
                            <div class="dropdown" style="display: inline-block;">
                                <a href="#" class="dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"
                                    style="outline: none; box-shadow: none; border: none; display: flex; align-items: center;">
                                    <img src="https://i.pinimg.com/736x/09/1e/b6/091eb62c743e1215099789d50c46a698.jpg" alt="" width="50" height="50" class="rounded-circle me-2"
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
                                            <img src="https://i.pinimg.com/736x/09/1e/b6/091eb62c743e1215099789d50c46a698.jpg" alt="User Avatar" class="rounded-circle" style="width: 80px; height: 80px;">
                                          </div>             
                                          <h5 class="user-info">
                                            <span class="text">Ms. Galinda Upland</span> 
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
                                    <form>
                                        <!-- Input Tanggal Pembelian -->
                                        <div class="mb-3">
                                            <label for="tanggalPembelian" class="form-label">Tanggal pembelian</label>
                                            <input type="date" class="form-control" id="tanggalPembelian">
                                        </div>

                                        <!-- Dropdown Data Mobil -->
                                        <div class="mb-3">
                                            <label for="dataMobil" class="form-label">Data Mobil</label>
                                            <select class="form-select" id="dataMobil" onchange="showCarInfo()">
                                                <option value="" selected disabled>Pilih data mobil</option>
                                                <option value="mobil1">Sedan - SI0133</option>
                                                <option value="mobil2">SUV - SI2023</option>
                                                <option value="mobil3">Hatchback - SI3001</option>
                                            </select>
                                        </div>

                                        <!-- Informasi Mobil -->
                                        <div class="mb-3">
                                            <textarea class="form-control custom-textarea" id="carInfo" readonly> Masukkan Data Mobil untuk melihat detail informasi.
                                            </textarea>
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
                                    <div class="row mb-3">
                                        <div class="col">
                                            <input type="date" id="startDate" class="form-control" placeholder="dd/mm/yyyy">
                                        </div>
                                        <div class="col-auto d-flex align-items-center">
                                            <span>—</span>
                                        </div>
                                        <div class="col">
                                            <input type="date" id="endDate" class="form-control" placeholder="dd/mm/yyyy">
                                        </div>
                                    </div>

                                    <!-- Pesan Jika Tanggal Belum Dipilih -->
                                    <div id="emptyMessage" class="empty-message">
                                        Masukkan Tanggal Untuk Melihat Rekapitulasi
                                    </div>

                                    <!-- Tabel Data -->
                                    <table id="rekapTable" class="table table-bordered custom-table">
                                        <thead>
                                            <tr>
                                                <th>Tanggal</th>
                                                <th>Foto Mobil</th>
                                                <th>ID Mobil</th>
                                                <th>Harga</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>27/05/2024</td>
                                                <td><img src="https://via.placeholder.com/120x80" class="car-img" alt="Mobil"></td>
                                                <td class="vertical-middle">sedanSI0133</td>
                                                <td class="vertical-middle">355.000.000</td>
                                            </tr>
                                            <tr>
                                                <td>28/05/2024</td>
                                                <td><img src="https://via.placeholder.com/120x80" class="car-img" alt="Mobil"></td>
                                                <td class="vertical-middle">sedanSI0133</td>
                                                <td class="vertical-middle">355.000.000</td>
                                            </tr>
                                            <tr>
                                                <td>10/06/2024</td>
                                                <td><img src="https://via.placeholder.com/120x80" class="car-img" alt="Mobil"></td>
                                                <td class="vertical-middle">sedanSI0133</td>
                                                <td class="vertical-middle">355.000.000</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="Bcontainer">
                    <table>
                        <thead>
                            <tr>
                                <th>Tanggal</th>
                                <th>Foto Mobil</th>
                                <th>ID Mobil</th>
                                <th>Harga</th>
                            </tr>
                        </thead>
                    </table>
                    <div class="scrollable-section">
                        <table>
                            <tbody>
                                <tr>
                                    <td>27/05/2024</td>
                                    <td class="image-container">
                                        <svg width="212" height="135" viewBox="0 0 212 135" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                            <rect width="212" height="135" fill="url(#pattern0_255_764)"/>
                                            <defs>
                                            <pattern id="pattern0_255_764" patternContentUnits="objectBoundingBox" width="1" height="1">
                                            <use xlink:href="#image0_255_764" transform="matrix(0.000925926 0 0 0.00145405 0 -0.285185)"/>
                                            </pattern>
                                            <image id="image0_255_764" width="1080" height="1080" xlink:href="car-image-placeholder.jpg"
                                            </defs>
                                        </svg>
                                    </td>
                                    <td>sedanSI0133</td>
                                    <td>Rp 355.000.000</td>
                                </tr>
                                <tr>
                                    <td>27/05/2024</td>
                                    <td class="image-container">
                                        <img src="car-image-placeholder.jpg" alt="Car">
                                    </td>
                                    <td>sedanSI0133</td>
                                    <td>Rp 355.000.000</td>
                                </tr>
                                <tr>
                                    <td>27/05/2024</td>
                                    <td class="image-container">
                                        <img src="car-image-placeholder.jpg" alt="Car">
                                    </td>
                                    <td>sedanSI0133</td>
                                    <td>Rp 355.000.000</td>
                                </tr>
                                <tr>
                                    <td>27/05/2024</td>
                                    <td class="image-container">
                                        <img src="car-image-placeholder.jpg" alt="Car">
                                    </td>
                                    <td>sedanSI0133</td>
                                    <td>Rp 355.000.000</td>
                                </tr>
                                <tr>
                                    <td>27/05/2024</td>
                                    <td class="image-container">
                                        <img src="car-image-placeholder.jpg" alt="Car">
                                    </td>
                                    <td>sedanSI0133</td>
                                    <td>Rp 355.000.000</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
              <!-- Bootstrap JS dan JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const startDate = document.getElementById('startDate');
        const endDate = document.getElementById('endDate');
        const table = document.getElementById('rekapTable');
        const emptyMessage = document.getElementById('emptyMessage');

        // Fungsi untuk mengecek apakah tanggal telah diisi
        function checkDateInput() {
            if (startDate.value && endDate.value) {
                table.style.display = 'table'; // Tampilkan tabel
                emptyMessage.style.display = 'none'; // Sembunyikan pesan kosong
            } else {
                table.style.display = 'none'; // Sembunyikan tabel
                emptyMessage.style.display = 'block'; // Tampilkan pesan kosong
            }
        }

        // Event Listener untuk input tanggal
        startDate.addEventListener('change', checkDateInput);
        endDate.addEventListener('change', checkDateInput);
        
        const carData = {
            mobil1: {
                id: "SI0133",
                nama: "Toyota Sedan",
                tipe: "Sedan",
                warna: "Hitam",
                gambar: "https://via.placeholder.com/120x80"
            },
            mobil2: {
                id: "SI2023",
                nama: "Honda SUV",
                tipe: "SUV",
                warna: "Putih",
                gambar: "https://via.placeholder.com/120x80"
            },
            mobil3: {
                id: "SI3001",
                nama: "Mazda Hatchback",
                tipe: "Hatchback",
                warna: "Merah",
                gambar: "https://via.placeholder.com/120x80"
            }
        };

        function showCarInfo() {
            const select = document.getElementById("dataMobil");
            const carInfo = document.getElementById("carInfo");
            const selectedValue = select.value;

            if (selectedValue && carData[selectedValue]) {
                const car = carData[selectedValue];
                carInfo.value = `
INFORMASI MOBIL
ID Mobil   : ${car.id}
Nama Mobil : ${car.nama}
Tipe Mobil : ${car.tipe}
Warna Mobil: ${car.warna}
                `;
            } else {
                carInfo.value = "Masukkan Data Mobil untuk melihat detail informasi.";
            }
        }
    </script>
    </div>
    </body>
</html>