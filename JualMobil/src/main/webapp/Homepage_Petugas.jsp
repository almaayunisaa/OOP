<%-- 
    Document   : sidebar
    Created on : 13 Dec 2024, 10.22.04
    Author     : Dell
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
                overflow: hidden;
            }

            .container-regist {
                display: flex;
                width: 100%;
                height: 100%;
                position: relative;
                overflow-y: hidden;
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
                border:none;
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
            
            .card-container {
                margin-top: 80px;
                display: flex;
                flex-wrap: wrap;
                gap: 60px;
                justify-content: center;
            }

            .card {
                width: 45%; /* 45% untuk 2 kolom, sisa 10% adalah jarak */
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 16px;
                font-family: Poppins;
                /*display: grid;  Gunakan Grid Layout */
                /*grid-template-rows: auto auto auto auto auto;  Pastikan elemen memiliki baris tetap */
                row-gap: 10px; /* Jarak antar elemen */
            }       
            
            .card img {
                width: 100%;
                height: auto;
                margin-bottom: 16px;
            }

            .card h3 { /* font buat judul */
                margin: 8px 0;
                font-size: 18px;
                color: #333;
            }

            .card p { 
                margin: 4px 0;
                font-size: 14px;
                color: #555;
            }
            
            .card .price {
                margin-top: 12px;
                font-size: 16px;
                font-weight: bold;
                color: #000;
            }
            
            .info-container {
                display: flex;
                justify-content: space-between; /* Distribute space between columns */
                gap: 20px; /* Space between columns */
                font-family: Arial, sans-serif;
                font-size: 14px;
                color: #555;
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
                <div class="card-container">
                    <!-- Card 1 -->
                    <div class="card">
                        <img src="images/subaru_impreza.jpg" alt="Subaru Impreza">
                        <h3>Subaru Impreza</h3>
                        <div class="info-container">
                            <div class="left-column">
                                <p>Type: <span>Sedan</span></p>
                                <p>Plat Nomor: <span>D 1234 AB</span></p>
                            </div>
                            <div class="right-column">
                                <p>ID Mobil: <span>SEDANS001</span></p>
                            </div>
                        </div>
                        <p class="price">Rp 500,000</p>
                    </div>

                    <!-- Card 2 -->
                    <div class="card">
                        <img src="images/toyota_camry.jpg" alt="Toyota Camry">
                        <h3>Toyota Camry</h3>
                        <div class="info-container">
                            <div class="left-column">
                                <p>Type: <span>Sedan</span></p>
                                <p>Plat Nomor: <span>B 5678 CD</span></p>
                            </div>
                            <div class="right-column">
                                <p>ID Mobil: <span>SEDANS002</span></p>
                            </div>
                        </div>
                        <p class="price">Rp 700,000</p>
                    </div>

                    <!-- Card 3 -->
                    <div class="card">
                        <img src="images/honda_civic.jpg" alt="Honda Civic">
                        <h3>Honda Civic</h3>
                        <div class="info-container">
                            <div class="left-column">
                                <p>Type: <span>Sedan</span></p>
                                <p>Plat Nomor: <span>A 9876 EF</span></p>
                            </div>
                            <div class="right-column">
                                <p>ID Mobil: <span>SEDANS003</span></p>
                            </div>
                        </div>
                        <p class="price">Rp 600,000</p>
                    </div>

                    <!-- Card 4 -->
                    <div class="card">
                        <img src="images/mazda_3.jpg" alt="Mazda 3">
                        <h3>Mazda 3</h3>
                        <div class="info-container">
                            <div class="left-column">
                                <p>Type: <span>Sedan</span></p>
                                <p>Plat Nomor: <span>F 1111 GH</span></p>
                            </div>
                            <div class="right-column">
                                <p>ID Mobil: <span>SEDANS004</span></p>
                            </div>
                        </div>
                        <p class="price">Rp 550,000</p>
                    </div>

                    <!-- Card 5 -->
                    <div class="card">
                        <img src="images/nissan_altima.jpg" alt="Nissan Altima">
                        <h3>Nissan Altima</h3>
                        <div class="info-container">
                            <div class="left-column">
                                <p>Type: <span>Sedan</span></p>
                                <p>Plat Nomor: <span>E 2222 IJ</span></p>
                            </div>
                            <div class="right-column">
                                <p>ID Mobil: <span>SEDANS005</span></p>
                            </div>
                        </div>
                        <p class="price">Rp 650,000</p>
                    </div>

                    <!-- Card 6 -->
                    <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" data-id="SEDANS002" data-name="Toyota Camry" data-type="Sedan" data-plate="B 5678 CD" data-price="Rp 700,000">
                        <img src="images/kia_optima.jpg" alt="Kia Optima">
                        <h3>Kia Optima</h3>
                        <div class="info-container">
                            <div class="left-column">
                                <p>Type: <span>Sedan</span></p>
                                <p>Plat Nomor: <span>G 3333 KL</span></p>
                            </div>
                            <div class="right-column">
                                <p>ID Mobil: <span>SEDANS006</span></p>
                            </div>
                        </div>
                        <p class="price">Rp 600,000</p>
                    </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="carModal" tabindex="-1" aria-labelledby="carModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="carModalLabel">Informasi Mobil</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-center">
                                <img id="carImage" src="" alt="Car" class="img-fluid mb-4">
                                <h3 id="carName"></h3>
                                <p><strong>ID Mobil:</strong> <span id="carId"></span></p>
                                <p><strong>Type:</strong> <span id="carType"></span></p>
                                <p><strong>Plat Nomor:</strong> <span id="carPlate"></span></p>
                                <p class="price"><strong>Harga:</strong> <span id="carPrice"></span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                // Data statistik mobil
                const cars = [
                    {
                        id: "SEDANS001",
                        name: "Subaru Impreza",
                        type: "Sedan",
                        plate: "D 1234 AB",
                        price: "Rp 500,000",
                        image: "images/subaru_impreza.jpg"
                    },
                    {
                        id: "SEDANS002",
                        name: "Toyota Camry",
                        type: "Sedan",
                        plate: "B 5678 CD",
                        price: "Rp 700,000",
                        image: "images/toyota_camry.jpg"
                    },
                    {
                        id: "SEDANS003",
                        name: "Honda Civic",
                        type: "Sedan",
                        plate: "A 9876 EF",
                        price: "Rp 600,000",
                        image: "images/honda_civic.jpg"
                    },
                    {
                        id: "SEDANS004",
                        name: "Mazda 3",
                        type: "Sedan",
                        plate: "F 1111 GH",
                        price: "Rp 550,000",
                        image: "images/mazda_3.jpg"
                    }
                ];

                // Generate cards dynamically
                const cardContainer = document.getElementById("cardContainer");

                cars.forEach(car => {
                    const card = document.createElement("div");
                    card.className = "card";
                    card.setAttribute("data-bs-toggle", "modal");
                    card.setAttribute("data-bs-target", "#carModal");
                    card.setAttribute("data-id", car.id);

                    card.innerHTML = `
                        <img src="${car.image}" alt="${car.name}">
                        <h3>${car.name}</h3>
                        <p>Type: <span>${car.type}</span></p>
                        <p>Plat Nomor: <span>${car.plate}</span></p>
                        <p class="price">${car.price}</p>
                    `;

                    cardContainer.appendChild(card);
                });

                // Event listener for modal
                const carModal = document.getElementById("carModal");
                carModal.addEventListener("show.bs.modal", function (event) {
                    const card = event.relatedTarget; // Card that triggered the modal
                    const carId = card.getAttribute("data-id");

                    // Find car data based on ID
                    const car = cars.find(car => car.id === carId);

                    if (car) {
                        // Update modal content
                        document.getElementById("carImage").setAttribute("src", car.image);
                        document.getElementById("carName").textContent = car.name;
                        document.getElementById("carId").textContent = car.id;
                        document.getElementById("carType").textContent = car.type;
                        document.getElementById("carPlate").textContent = car.plate;
                        document.getElementById("carPrice").textContent = car.price;
                    }
                });
            </script>
             </div> 
            </div>
    </div>
    </body>
</html>