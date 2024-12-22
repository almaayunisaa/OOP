<%@page import="com.mycompany.jualmobil.dao.MobilDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.jualmobil.beans.Mobil"%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
              Â Â border: none;
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
                table-layout: fixed;
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

            .custom-dropdown-btn {
                background-color: inherit !important; /* Green background */
                color: #939393DB !important; /* White text */
                border: 2px solid #939393DB !important; /* Custom border */
                width: 95px;
                height: 45px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .custom-search {
                width: 250px;
                background-color: inherit !important; /* Green background */
                color: #939393DB !important; /* White text */
                border: 2px solid #939393DB !important; /* Custom border */
                border-radius: 6px;
                height: 45px;
                display: flex;
                align-items: center;
            }

            .form-control.custom-input {
                border: 0;
                background-color: inherit;
            }

            .form-control.custom-input::placeholder{
                color: #939393;
            }

            .custom-action-btn {
                background-color: inherit !important; /* Green background */
                color: #939393DB !important; /* White text */        
                font-weight: 500;    
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
                        <a href="Homepage_Petugas.jsp" class="nav-link active">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20.8333 19.7916V10.9374C20.8333 10.7757 20.7957 10.6162 20.7233 10.4716C20.651 10.3269 20.546 10.2011 20.4167 10.1041L13.125 4.63534C12.9447 4.5001 12.7254 4.427 12.5 4.427C12.2746 4.427 12.0553 4.5001 11.875 4.63534L4.58332 10.1041C4.45395 10.2011 4.34895 10.3269 4.27663 10.4716C4.20431 10.6162 4.16666 10.7757 4.16666 10.9374V19.7916C4.16666 20.0679 4.2764 20.3328 4.47175 20.5282C4.6671 20.7235 4.93206 20.8333 5.20832 20.8333H9.37499C9.65126 20.8333 9.91621 20.7235 10.1116 20.5282C10.3069 20.3328 10.4167 20.0679 10.4167 19.7916V16.6666C10.4167 16.3903 10.5264 16.1254 10.7218 15.93C10.9171 15.7347 11.1821 15.6249 11.4583 15.6249H13.5417C13.8179 15.6249 14.0829 15.7347 14.2782 15.93C14.4736 16.1254 14.5833 16.3903 14.5833 16.6666V19.7916C14.5833 20.0679 14.6931 20.3328 14.8884 20.5282C15.0838 20.7235 15.3487 20.8333 15.625 20.8333H19.7917C20.0679 20.8333 20.3329 20.7235 20.5282 20.5282C20.7236 20.3328 20.8333 20.0679 20.8333 19.7916Z" fill="white" stroke="white" stroke-width="2.08333" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg> 
                            Beranda
                            <hr>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="produk.jsp" class="nav-link">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M9 8V6H15V8H9ZM7 22C6.45 22 5.97933 21.8043 5.588 21.413C5.19667 21.0217 5.00067 20.5507 5 20C4.99933 19.4493 5.19533 18.9787 5.588 18.588C5.98067 18.1973 6.45133 18.0013 7 18C7.54867 17.9987 8.01967 18.1947 8.413 18.588C8.80633 18.9813 9.002 19.452 9 20C8.998 20.548 8.80233 21.019 8.413 21.413C8.02367 21.807 7.55267 22.0027 7 22ZM17 22C16.45 22 15.9793 21.8043 15.588 21.413C15.1967 21.0217 15.0007 20.5507 15 20C14.9993 19.4493 15.1953 18.9787 15.588 18.588C15.9807 18.1973 16.4513 18.0013 17 18C17.5487 17.9987 18.0197 18.1947 18.413 18.588C18.8063 18.9813 19.002 19.452 19 20C18.998 20.548 18.8023 21.019 18.413 21.413C18.0237 21.807 17.5527 22.0027 17 22ZM1 4V2H4.275L8.525 11H15.525L19.425 4H21.7L17.3 11.95C17.1167 12.2833 16.871 12.5417 16.563 12.725C16.255 12.9083 15.9173 13 15.55 13H8.1L7 15H19V17H7C6.25 17 5.679 16.675 5.287 16.025C4.895 15.375 4.88267 14.7167 5.25 14.05L6.6 11.6L3 4H1Z" fill="white"/>
                                </svg>                                
                            Produk 
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
                                    <img src="https://i.pinimg.com/736x/42/ca/a2/42caa25497d797187ba0afc537ee4bfc.jpg" alt="" width="50" height="50" class="rounded-circle me-2"
                                        style="margin-right: 5px;">
                                    <svg class="dropdown-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"
                                        style="margin-left: 0;">
                                        <path d="M16.8583 5.19166L18.3333 6.66666L9.99998 15L1.66665 6.66666L3.14165 5.19166L9.99998 12.05L16.8583 5.19166Z" fill="#939393"/>
                                    </svg>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end" tabindex="-1" aria-hidden="true" style="z-index: 1050;">
                                    <div class="modal-dialog modal-dialog-custom">
                                      <div class="modal-content" style="height: 100%; width: 100%">
                                        <div class="modal-body modal-body-user text-center">
                                          <div class="mb-3">
                                            <img src="https://i.pinimg.com/736x/42/ca/a2/42caa25497d797187ba0afc537ee4bfc.jpg" alt="User Avatar" class="rounded-circle" style="width: 80px; height: 80px;">
                                          </div>             
                                          <h5 class="user-info">
                                            <span class="text">Ms. Elphaba Thropp</span> 
                                            <p>Petugas</p>
                                          </h5>  
                                          <form action="#logout" method="POST">
                                            <button type="submit" class="btn">
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M7.02301 5.5C5.4122 6.56898 4.18841 8.12823 3.53281 9.94691C2.87722 11.7656 2.82467 13.7471 3.38294 15.5979C3.94121 17.4488 5.08063 19.0707 6.63252 20.2236C8.18441 21.3765 10.0663 21.999 11.9995 21.999C13.9328 21.999 15.8146 21.3765 17.3665 20.2236C18.9184 19.0707 20.0578 17.4488 20.6161 15.5979C21.1744 13.7471 21.1218 11.7656 20.4662 9.94691C19.8106 8.12823 18.5868 6.56898 16.976 5.5M12 2V10" stroke="black" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                                    </svg>                                                    
                                            </button>
                                          </form>           
                                        </div>
                                      </div>
                                    </div>
                                </div> 
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="container">
                    <div class="Acontainer align-self-xl-stretch">
                        <div class="container">
                            <div class="custom-search">
                                <div class="input-group">
                                    <input type="text" class="form-control custom-input" placeholder="Cari nama produk" aria-label="Search" aria-describedby="search-addon">
                                    <button class="btn" type="button" id="search-addon">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M9.5 16C7.68333 16 6.146 15.3707 4.888 14.112C3.63 12.8533 3.00067 11.316 3 9.5C2.99933 7.684 3.62867 6.14667 4.888 4.888C6.14733 3.62933 7.68467 3 9.5 3C11.3153 3 12.853 3.62933 14.113 4.888C15.373 6.14667 16.002 7.684 16 9.5C16 10.2333 15.8833 10.925 15.65 11.575C15.4167 12.225 15.1 12.8 14.7 13.3L20.3 18.9C20.4833 19.0833 20.575 19.3167 20.575 19.6C20.575 19.8833 20.4833 20.1167 20.3 20.3C20.1167 20.4833 19.8833 20.575 19.6 20.575C19.3167 20.575 19.0833 20.4833 18.9 20.3L13.3 14.7C12.8 15.1 12.225 15.4167 11.575 15.65C10.925 15.8833 10.2333 16 9.5 16ZM9.5 14C10.75 14 11.8127 13.5627 12.688 12.688C13.5633 11.8133 14.0007 10.7507 14 9.5C13.9993 8.24933 13.562 7.187 12.688 6.313C11.814 5.439 10.7513 5.00133 9.5 5C8.24867 4.99867 7.18633 5.43633 6.313 6.313C5.43967 7.18967 5.002 8.252 5 9.5C4.998 10.748 5.43567 11.8107 6.313 12.688C7.19033 13.5653 8.25267 14.0027 9.5 14Z" fill="#939393"/>
                                        </svg>                                            
                                    </button>
                                </input>
                                </div>
                            </div>
                        </div>
                        <div class="buttons">
                            <div class="dropdown" >
                                <button class="btn custom-dropdown-btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                  Filter
                                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin: 3px;">
                                    <path d="M12 14.475L19.35 7.12503C19.6 6.87503 19.896 6.75403 20.238 6.76203C20.58 6.77003 20.8757 6.89936 21.125 7.15003C21.3743 7.4007 21.4993 7.6967 21.5 8.03803C21.5007 8.37936 21.3757 8.67503 21.125 8.92503L13.425 16.6C13.225 16.8 13 16.95 12.75 17.05C12.5 17.15 12.25 17.2 12 17.2C11.75 17.2 11.5 17.15 11.25 17.05C11 16.95 10.775 16.8 10.575 16.6L2.875 8.90003C2.625 8.65003 2.504 8.35836 2.512 8.02503C2.52 7.6917 2.64933 7.40003 2.9 7.15003C3.15067 6.90003 3.44666 6.77503 3.788 6.77503C4.12933 6.77503 4.425 6.90003 4.675 7.15003L12 14.475Z" fill="#939393"/>
                                    </svg>                                    
                                </button>
                                <ul class="dropdown-menu">
                                  <li><a class="dropdown-item" href="#">Action</a></li>
                                  <li><a class="dropdown-item" href="#">Another action</a></li>
                                  <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                              </div>                       
                            <button class="button" data-bs-toggle="modal" data-bs-target="#tambahModal">+ Tambah</button>
                        </div>
                    </div>
                    <div class="Bcontainer">
                        <table>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Nama Produk</th>
                                    <th>Harga</th>
                                    <th>Stok</th>
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                        <div class="scrollable-section">
                            <table>      
                                <tbody>
                                    <%
                                         List<Mobil> daftarMobil = (List<Mobil>) request.getAttribute("daftarMobil");
                                        
                                        if (daftarMobil!=null) {
                                            for (Mobil mobil : daftarMobil) {
                                    %>
                                    
                                    <tr>
                                        <td><img src="https://via.placeholder.com/120x80" class="car-img" alt="Mobil"></td>
                                        <td class="vertical-middle"><%=mobil.getNama() %></td>
                                        <td class="vertical-middle">Rp <%= String.format("%,.2f", mobil.getHarga()) %></td>
                                        <td class="vertical-middle"><%=mobil.getKetersediaan() %></td>
                                        <td>
                                            <!-- Edit Button -->
                                            <form action="mobilController" method="get">
                                                <input type="hidden" name="action" value="getMobil">
                                                <input type="hidden" name="idMobil" value="<%= mobil.getIdMobil() %>">
                                                <button type="submit" class="btn custom-action-btn" data-bs-toggle="modal" data-bs-target="#editModal">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M5 19H6.425L16.2 9.225L14.775 7.8L5 17.575V19ZM3 21L3 16.75L16.2 3.575C16.4 3.39167 16.621 3.25 16.863 3.15C17.105 3.05 17.359 3 17.625 3C17.891 3 18.1493 3.05 18.4 3.15C18.6507 3.25 18.8673 3.4 19.05 3.6L20.425 5C20.625 5.18333 20.771 5.4 20.863 5.65C20.955 5.9 21.0007 6.15 21 6.4C21 6.66667 20.9543 6.921 20.863 7.163C20.7717 7.405 20.6257 7.62567 20.425 7.825L7.25 21H3ZM15.475 8.525L14.775 7.8L16.2 9.225L15.475 8.525Z" fill="#939393"/>
                                                    </svg>                                                
                                                    Edit
                                                </button>
                                            
                                            <!-- Delete Button -->
                                            <form action="mobilController" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="<%= mobil.getIdMobil() %>">
                                                <button type="submit" class="btn custom-action-btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="<%=mobil.getIdMobil() %>" >
                                                    <svg width="16" height="18" viewBox="0 0 16 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M3 18C2.45 18 1.97933 17.8043 1.588 17.413C1.19667 17.0217 1.00067 16.5507 1 16V3H0V1H5V0H11V1H16V3H15V16C15 16.55 14.8043 17.021 14.413 17.413C14.0217 17.805 13.5507 18.0007 13 18H3ZM13 3H3V16H13V3ZM5 14H7V5H5V14ZM9 14H11V5H9V14Z" fill="#939393"/>
                                                    </svg>                                                
                                                    Delete
                                                </button>
                                            </form>
                                           
                                        </td>
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
                <!--  Tambah Modal -->
                <div class="modal fade" id="tambahModal" tabindex="-1" aria-labelledby="tambahModalLabel" aria-hidden="true">
                    <div class="modal-dialog custom-modal-size">
                        <div class="modal-content">
                            <form action="mobilController" method="post">
                            <input type="hidden" name="action" value="tambah">
                            <div class="modal-header">
                                <h5 class="modal-title" id="carModalLabel">Tambah Produk</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div style="margin-bottom: 20px;">
                                    <div class="mb-4 d-flex justify-content-center">
                                        <img id="selectedImage" src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
                                        alt="example placeholder" style="width: 300px;" />
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <div data-mdb-ripple-init class="btn btn-primary btn-rounded">
                                            <label class="form-label text-white m-1" for="customFile1">Choose file</label>
                                            <input type="file" class="form-control d-none" id="customFile1" onchange="displaySelectedImage(event, 'selectedImage')" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="idMobil" class="form-label">ID Mobil</label>
                                        <input type="text" class="form-control"  value=" XXX" aria-label="Disabled input example" name="idMobil" id="idMobil" required>
                                    </div>
                                    <div class="col">
                                        <label for="nama" class="form-label">Nama Mobil</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="namaMobil" id="namaMobil" required>
                                    </div>
                                    <div class="col">
                                        <label for="tipeMobil" class="form-label">Type</label>
                                        <select class="form-control"  name="tipeMobil" id="tipeMobil" required>
                                            <option value="SUV">SUV</option>
                                            <option value="MPV">MPV</option>
                                            <option value="Sedan">Sedan</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label for="warnaMobil" class="form-label">Warna Mobil</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="warnaMobil" id="warnaMobil" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="platNomor" class="form-label">Plat Nomor</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="platNomor" id="platNomor" required>
                                    </div>
                                    <div class="col">
                                        <label for="odoMeter" class="form-label">Odometer</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="odoMeter" id="odoMeter" required>
                                    </div>
                                    <div class="col">
                                        <label for="kapasitasMesin" class="form-label">Kapasitas Mesin</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="kapasitasMesin" id="kapasitasMesin" required>
                                    </div>
                                    <div class="col">
                                        <label for="ketersediaan" class="form-label">Ketersediaan</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="ketersediaan" id="ketersediaan" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-4">
                                        <label for="nomorRangka" class="form-label">Nomor Rangka</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="nomorRangka" id="nomorRangka" required>
                                    </div>
                                    <div class="col-4">
                                        <label for="nomorMesin" class="form-label">Nomor Mesin</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="nomorMesin" id="nomorMesin" required>
                                    </div>
                                    <div class="col-3">
                                        <label for="harga" class="form-label">Harga</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" name="harga" id="harga" required>
                                    </div>
                                    <div class="col-1">
                                        <label for="exampleFormControlTextarea1" class="form-label"></label>
                                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
                                    </div>
                                </div>
                               

                                <!-- <img id="modalImage" src="" alt="Car Image" class="img-fluid mb-3">
                                <h3 id="modalName"></h3>
                                <p><strong>Type:</strong> <span id="modalType"></span></p>
                                <p><strong>Warna:</strong> <span id="modalColor"></span></p>
                                <p><strong>Plat Nomor:</strong> <span id="modalPlate"></span></p>
                                <p><strong>Odometer:</strong> <span id="modalOdometer"></span></p>
                                <p><strong>Kapasitas Mesin:</strong> <span id="modalEngineCapacity"></span></p>
                                <p><strong>Ketersediaan:</strong> <span id="modalAvailability"></span></p>
                                <p><strong>Nomor Rangka:</strong> <span id="modalChassisNumber"></span></p>
                                <p><strong>Nomor Mesin:</strong> <span id="modalEngineNumber"></span></p>
                                <p><strong>Harga Sewa:</strong> <span id="modalPrice"></span></p>
                                <p><strong>ID Mobil:</strong> <span id="modalID"></span></p> -->
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                    Mobil mobil = (Mobil) request.getAttribute("mobil");
                    Boolean popUpEdit = (Boolean) request.getAttribute("popUpEdit");
                %>
                <!--  Edit Modal -->
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true" 
                    <%if (Boolean.TRUE.equals(popUpEdit)) {%> aria-modal="true" role="dialog" <% } %>>
                    <div class="modal-dialog custom-modal-size">
                        <div class="modal-content">
                            <form action="mobilController" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="idMobil" value="${mobil.idMobil}">
                            <div class="modal-header">
                                <h5 class="modal-title" id="carModalLabel">Edit Produk</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div style="margin-bottom: 20px;">
                                    <div class="mb-4 d-flex justify-content-center">
                                        <img id="selectedImage" src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
                                        alt="example placeholder" style="width: 300px;" />
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <div data-mdb-ripple-init class="btn btn-primary btn-rounded">
                                            <label class="form-label text-white m-1" for="customFile1">Choose file</label>
                                            <input type="file" class="form-control d-none" id="customFile1" onchange="displaySelectedImage(event, 'selectedImage')" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="idMobil_edit" class="form-label">ID Mobil</label>
                                        <input type="text" class="form-control"  value="${mobil.idMobil}" aria-label="Disabled input example" name="idMobil_edit" id="idMobil_edit" readonly>
                                    </div>
                                    <div class="col">
                                        <label for="nama_edit" class="form-label">Nama Mobil</label>
                                        <input type="text" class="form-control"   value=" ${mobil.nama}" aria-label="Disabled input example" name="nama_edit" id="nama_edit" required>
                                    </div>
                                    <div class="col">
                                        <label for="tipeMobil_edit" class="form-label">Type</label>
                                        <select class="form-control"  name="tipeMobil_edit" id="tipeMobil_edit" required>
                                            <option value="" >-- Pilih Tipe --</option>
                                            <option value="SUV">SUV</option>
                                            <option value="MPV">MPV</option>
                                            <option value="Sedan">Sedan</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label for="warnaMobil_edit" class="form-label">Warna Mobil</label>
                                        <input type="text" class="form-control"   value="${mobil.warna}" aria-label="Disabled input example" name="warnaMobil_edit" id="warnaMobil_edit" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="platNomor_edit" class="form-label">Plat Nomor</label>
                                        <input type="text" class="form-control"   value="${mobil.platNomor}" aria-label="Disabled input example" name="platNomor_edit" id="platNomor_edit" required>
                                    </div>
                                    <div class="col">
                                        <label for="odoMeter_edit" class="form-label">Odometer</label>
                                        <input type="text" class="form-control"   value="${mobil.odoMeter}" aria-label="Disabled input example" name="odoMeter_edit" id="odoMeter_edit" required>
                                    </div>
                                    <div class="col">
                                        <label for="kapasitasMesin_edit" class="form-label">Kapasitas Mesin</label>
                                        <input type="text" class="form-control"   value="${mobil.kapasitasMesin}" aria-label="Disabled input example" name="kapasitasMesin_edit" id="kapasitasMesin_edit" required>
                                    </div>
                                    <div class="col">
                                        <label for="ketersediaan_edit" class="form-label">Ketersediaan</label>
                                        <input type="text" class="form-control"   value="${mobil.ketersediaan}" aria-label="Disabled input example" name="ketersediaan_edit" id="ketersediaan_edit" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-4">
                                        <label for="nomorRangka_edit" class="form-label">Nomor Rangka</label>
                                        <input type="text" class="form-control"   value="${mobil.nomorRangka}" aria-label="Disabled input example" name="nomorRangka_edit" id="nomorRangka_edit" required>
                                    </div>
                                    <div class="col-4">
                                        <label for="nomorMesin_edit" class="form-label">Nomor Mesin</label>
                                        <input type="text" class="form-control"   value="${mobil.nomorMesin}" aria-label="Disabled input example" name="nomorMesin_edit" id="nomorMesin_edit" required>
                                    </div>
                                    <div class="col-3">
                                        <label for="harga_edit" class="form-label">Harga</label>
                                        <input type="text" class="form-control"   value="<%=String.format("%.0f", mobil.getHarga())%>" aria-label="Disabled input example" name="harga_edit" id="harga_edit" required>
                                    </div>
                                    <div class="col-1">
                                        <label for="exampleFormControlTextarea1" class="form-label"></label>
                                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
                                    </div>
                                </div>

                                <!-- <img id="modalImage" src="" alt="Car Image" class="img-fluid mb-3">
                                <h3 id="modalName"></h3>
                                <p><strong>Type:</strong> <span id="modalType"></span></p>
                                <p><strong>Warna:</strong> <span id="modalColor"></span></p>
                                <p><strong>Plat Nomor:</strong> <span id="modalPlate"></span></p>
                                <p><strong>Odometer:</strong> <span id="modalOdometer"></span></p>
                                <p><strong>Kapasitas Mesin:</strong> <span id="modalEngineCapacity"></span></p>
                                <p><strong>Ketersediaan:</strong> <span id="modalAvailability"></span></p>
                                <p><strong>Nomor Rangka:</strong> <span id="modalChassisNumber"></span></p>
                                <p><strong>Nomor Mesin:</strong> <span id="modalEngineNumber"></span></p>
                                <p><strong>Harga Sewa:</strong> <span id="modalPrice"></span></p>
                                <p><strong>ID Mobil:</strong> <span id="modalID"></span></p> -->
                            </div>
                            
                            </form>
                        </div>
                    </div>
                </div>
                <% if (Boolean.TRUE.equals(popUpEdit)) { %>
                <script>
                    var popUpEdit = new bootstrap.Modal(document.getElementById('editModal'), {});
                    popUpEdit.show();
                </script>
                <% } %>
            </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>