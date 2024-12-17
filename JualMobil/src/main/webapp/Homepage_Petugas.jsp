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
              ��border: none;
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
                position: absolute; /* Pastikan dropdown diposisikan secara absolut */
                z-index: 1050; /* Pastikan nilainya lebih tinggi daripada elemen lainnya */
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
                gap: 80px;
                justify-content: center;
                position: relative; /* Tidak menyebabkan konflik dengan dropdown */
                overflow: visible; /* Hindari menyembunyikan elemen dropdown */
            }

            .card {
                width: 35%; /* 45% untuk 2 kolom, sisa 10% adalah jarak */
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 40px;
                font-family: Poppins;
                display: grid;  
                grid-template-rows: auto auto auto auto auto; 
                row-gap: 10px; /* Jarak antar elemen */
                cursor: pointer;
                transition: box-shadow 0.3s ease;
                z-index: 1; /* Pastikan card tidak menutupi dropdown */
            }       
            
            .card:hover {
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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

            .custom-modal-size{
                max-width: 100%;
                width: 100%;
                display: flex;
                justify-content: center;
            }
            .modal-content {
                width: 900px;
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
                <div class="card-container">
                    <!-- Card 1: Subaru Impreza -->
                   <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" data-id="SEDANS001">
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

                    <!-- Card 2: Toyota Camry -->
                    <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" 
                         data-id="SEDANS002" data-name="Toyota Camry" data-type="Sedan" 
                         data-color="White" data-plate="B 5678 CD" data-odometer="35,000 km" 
                         data-engine-capacity="2500 cc" data-availability="Available" 
                         data-chassis="2DEF45678UVW" data-engine="9876543210" data-price="Rp 700,000">
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

                    <!-- Card 3: Honda Civic -->
                    <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" 
                         data-id="SEDANS003" data-name="Honda Civic" data-type="Sedan" 
                         data-color="Red" data-plate="A 9876 EF" data-odometer="50,000 km" 
                         data-engine-capacity="1800 cc" data-availability="Out of Stock" 
                         data-chassis="3XYZ78901LMN" data-engine="1029384756" data-price="Rp 600,000">
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

                    <!-- Card 4: Mazda 3 -->
                    <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" 
                         data-id="SEDANS004" data-name="Mazda 3" data-type="Sedan" 
                         data-color="Black" data-plate="F 1111 GH" data-odometer="15,000 km" 
                         data-engine-capacity="1600 cc" data-availability="Available" 
                         data-chassis="4LMN23456OPQ" data-engine="5678901234" data-price="Rp 550,000">
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

                    <!-- Card 5: Nissan Altima -->
                    <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" 
                         modal-id="SEDANS005" data-name="Nissan Altima" data-type="Sedan" 
                         data-color="Silver" data-plate="E 2222 IJ" data-odometer="40,000 km" 
                         data-engine-capacity="2400 cc" data-availability="Available" 
                         data-chassis="5PQR56789XYZ" data-engine="8765432109" data-price="Rp 650,000">
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

                    <!-- Card 6: Kia Optima -->
                    <div class="card" data-bs-toggle="modal" data-bs-target="#carModal" 
                         data-id="SEDANS006" data-name="Kia Optima" data-type="Sedan" 
                         data-color="Grey" data-plate="G 3333 KL" data-odometer="25,000 km" 
                         data-engine-capacity="2200 cc" data-availability="Out of Stock" 
                         data-chassis="6STU67890XYZ" data-engine="5432167890" data-price="Rp 600,000">
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
                    <div class="modal-dialog custom-modal-size">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="carModalLabel">Detail Mobil</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <img id="modalImage" src="" alt="Car Image" class="img-fluid mb-3">
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">ID Mobil</label>
                                        <input type="text" class="form-control"  value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Nama Mobil</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Type</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Warna Mobil</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Plat Nomor</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Odometer</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Kapasitas Mesin</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Ketersediaan</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Nomor Rangka</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Nomor Mesin</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
                                    </div>
                                    <div class="col">
                                        <label for="exampleFormControlTextarea1" class="form-label">Harga</label>
                                        <input type="text" class="form-control"   value=" XXX" aria-label="Disabled input example" disabled readonly>
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
                        </div>
                    </div>
                </div>
            <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Ambil semua elemen dengan atribut data-bs-toggle="modal"
            const carsData = [
                {
                    id: 'SEDANS001',
                    name: 'Subaru Impreza',
                    type: 'Sedan',
                    color: 'Merah',
                    plate: 'D 1234 AB',
                    odometer: '25,000 km',
                    engineCapacity: '2.0 L',
                    availability: 'Tersedia',
                    chassisNumber: 'X1234567890',
                    engineNumber: 'EN1234567890',
                    price: 'Rp 500,000',
                    image: 'images/subaru_impreza.jpg'
                },
                {
                    id: 'SEDANS002',
                    name: 'Toyota Camry',
                    type: 'Sedan',
                    color: 'Putih',
                    plate: 'B 5678 CD',
                    odometer: '35,000 km',
                    engineCapacity: '2.5 L',
                    availability: 'Tersedia',
                    chassisNumber: 'X0987654321',
                    engineNumber: 'EN0987654321',
                    price: 'Rp 700,000',
                    image: 'images/toyota_camry.jpg'
                },
                {
                    id: 'SEDANS003',
                    name: 'Honda Civic',
                    type: 'Sedan',
                    color: 'Biru',
                    plate: 'A 9876 EF',
                    odometer: '20,000 km',
                    engineCapacity: '1.8 L',
                    availability: 'Tersedia',
                    chassisNumber: 'X1122334455',
                    engineNumber: 'EN1122334455',
                    price: 'Rp 600,000',
                    image: 'images/honda_civic.jpg'
                },
                {
                    id: 'SEDANS004',
                    name: 'Mazda 3',
                    type: 'Sedan',
                    color: 'Hitam',
                    plate: 'F 1111 GH',
                    odometer: '15,000 km',
                    engineCapacity: '2.0 L',
                    availability: 'Tersedia',
                    chassisNumber: 'X2233445566',
                    engineNumber: 'EN2233445566',
                    price: 'Rp 550,000',
                    image: 'images/mazda_3.jpg'
                },
                {
                    id: 'SEDANS005',
                    name: 'Nissan Altima',
                    type: 'Sedan',
                    color: 'Abu-abu',
                    plate: 'E 2222 IJ',
                    odometer: '40,000 km',
                    engineCapacity: '2.5 L',
                    availability: 'Tersedia',
                    chassisNumber: 'X3344556677',
                    engineNumber: 'EN3344556677',
                    price: 'Rp 650,000',
                    image: 'images/nissan_altima.jpg'
                },
                {
                    id: 'SEDANS006',
                    name: 'Kia Optima',
                    type: 'Sedan',
                    color: 'Perak',
                    plate: 'G 3333 KL',
                    odometer: '30,000 km',
                    engineCapacity: '2.4 L',
                    availability: 'Tersedia',
                    chassisNumber: 'X4455667788',
                    engineNumber: 'EN4455667788',
                    price: 'Rp 600,000',
                    image: 'images/kia_optima.jpg'
                }
            ];

              // Menangani event klik pada setiap card
            const cards = document.querySelectorAll('.card');
            cards.forEach(card => {
                card.addEventListener('click', (e) => {
                    // Mendapatkan ID mobil yang dipilih
                    const carID = card.getAttribute('data-id');

                    // Mencari data mobil yang sesuai dengan ID
                    const car = carsData.find(car => car.id === carID);

                    // Mengisi data ke dalam modal
                    document.getElementById('modalImage').src = car.image;
                    document.getElementById('modalName').innerText = car.name;
                    document.getElementById('modalType').innerText = car.type;
                    document.getElementById('modalColor').innerText = car.color;
                    document.getElementById('modalPlate').innerText = car.plate;
                    document.getElementById('modalOdometer').innerText = car.odometer;
                    document.getElementById('modalEngineCapacity').innerText = car.engineCapacity;
                    document.getElementById('modalAvailability').innerText = car.availability;
                    document.getElementById('modalChassisNumber').innerText = car.chassisNumber;
        </script>

    </div>
    </body>
</html>