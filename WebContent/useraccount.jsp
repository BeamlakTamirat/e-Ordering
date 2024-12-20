<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | ASTU</title>
    <link rel="icon" type="image/x-icon" href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZzPo9uv7MUCwwLTBVLgf29PIwG_Or3n2uVw&usqp=CAU">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f2f5;
            color: #1a1a1a;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 2rem auto;
            padding: 20px;
        }

        .profile-header {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .profile-picture-container {
            position: relative;
            width: 200px;
            height: 200px;
            margin: 0 auto 1rem;
        }

        .profile-picture {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 5px solid white;
            object-fit: cover;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .profile-picture-upload {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: white;
            border-radius: 50%;
            padding: 8px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .profile-picture-upload:hover {
            background: #f0f0f0;
        }

        .profile-name {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .profile-role {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .profile-stats {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin: 1rem 0;
        }

        .stat-item {
            text-align: center;
        }

        .stat-value {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        .profile-content {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        #table td {
            padding: 1rem;
            border: none;
            border-bottom: 1px solid #eee;
        }

        #table tr:last-child td {
            border-bottom: none;
        }

        #table td:first-child {
            font-weight: 600;
            color: #666;
            width: 30%;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
        }

        .btn-primary {
            background: #1e3c72;
            color: white;
        }

        .btn-danger {
            background: #dc3545;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:hover {
            background: #2a5298;
        }

        .btn-danger:hover {
            background: #c82333;
        }

        .profile-badges {
            display: flex;
            gap: 1rem;
            margin: 1rem 0;
            flex-wrap: wrap;
            justify-content: center;
        }

        .badge {
            background: #e9ecef;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            color: #495057;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 10px;
            }

            .profile-header {
                padding: 1rem;
            }

            .profile-picture {
                width: 150px;
                height: 150px;
            }

            .profile-stats {
                flex-wrap: wrap;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile-header">
            <div class="profile-picture-container">
                <img src="data:image/jpeg;base64,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" 
                     alt="Profile Picture" class="profile-picture" id="profileImage">
                <label for="profilePicInput" class="profile-picture-upload">
                    <i class="fas fa-camera"></i>
                </label>
                <input type="file" id="profilePicInput" style="display: none;" accept="image/*">
            </div>

            <c:forEach var="cus" items="${cusDetails}">
                <h1 class="profile-name">${cus.name}</h1>
                <p class="profile-role">${cus.role}</p>

                <div class="profile-stats">
                    <div class="stat-item">
                        <div class="stat-value"><i class="fas fa-shopping-cart"></i></div>
                        <div class="stat-label">Orders</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value"><i class="fas fa-heart"></i></div>
                        <div class="stat-label">Wishlist</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value"><i class="fas fa-star"></i></div>
                        <div class="stat-label">Reviews</div>
                    </div>
                </div>

                <div class="profile-badges">
                    <span class="badge"><i class="fas fa-medal"></i> Verified User</span>
                    <span class="badge"><i class="fas fa-shield-alt"></i> Premium Member</span>
                </div>
            </c:forEach>
        </div>

        <div class="profile-content">
            <table id="table">
                <c:forEach var="cus" items="${cusDetails}">
                    <c:set var="id" value="${cus.id}"/>
                    <c:set var="name" value="${cus.name}"/>
                    <c:set var="email" value="${cus.email}"/>
                    <c:set var="phone" value="${cus.phone}"/>
                    <c:set var="address" value="${cus.address}"/>
                    <c:set var="username" value="${cus.username}"/>
                    <c:set var="password" value="${cus.password}"/>
                    <c:set var="role" value="${cus.role}"/>

                    <tr>
                        <td><i class="fas fa-id-badge"></i> My ID</td>
                        <td>${cus.id}</td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-user"></i> Name</td>
                        <td>${cus.name}</td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-envelope"></i> Email</td>
                        <td>${cus.email}</td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-phone"></i> Phone Number</td>
                        <td>${cus.phone}</td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-map-marker-alt"></i> Delivery Address</td>
                        <td>${cus.address}</td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-user-circle"></i> Username</td>
                        <td>${cus.username}</td>
                    </tr>
                    <tr>
                        <td><i class="fas fa-user-tag"></i> Role</td>
                        <td>${cus.role}</td>
                    </tr>
                </c:forEach>
            </table>

            <div class="action-buttons">
                <c:url value="updatecustomer.jsp" var="cusupdate">
                    <c:param name="id" value="${id}"/>
                    <c:param name="name" value="${name}"/>
                    <c:param name="email" value="${email}"/>
                    <c:param name="phone" value="${phone}"/>
                    <c:param name="address" value="${address}"/>
                    <c:param name="uname" value="${username}"/>
                    <c:param name="pass" value="${password}"/>
                    <c:param name="role" value="${role}"/>
                </c:url>
                <a href="${cusupdate}" class="btn btn-primary">
                    <i class="fas fa-edit"></i> Update Profile
                </a>

                <c:url value="deletecustomer.jsp" var="cusdelete">
                    <c:param name="id" value="${id}"/>
                    <c:param name="name" value="${name}"/>
                    <c:param name="email" value="${email}"/>
                    <c:param name="phone" value="${phone}"/>
                    <c:param name="address" value="${address}"/>
                    <c:param name="uname" value="${username}"/>
                    <c:param name="pass" value="${password}"/>
                    <c:param name="role" value="${role}"/>
                </c:url>
                <a href="${cusdelete}" class="btn btn-danger">
                    <i class="fas fa-trash-alt"></i> Delete Account
                </a>
            </div>
        </div>
    </div>

    <script>
        // Profile picture upload preview
        const profilePicInput = document.getElementById('profilePicInput');
        const profileImage = document.getElementById('profileImage');

        profilePicInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    profileImage.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>