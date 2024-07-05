<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Website</title>
        <style>
            .footer {
                background-color: #333;
                color: #fff;
                display: flex;
                justify-content: space-between;
                padding: 20px;
            }
            .heart {
                color: red;
            }
            .partition {
                flex: 1;
                padding: 0 20px;
                max-width: 200px;
            }
            .partition h3 {
                margin-top: 0;
            }
            .social-buttons {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
            }
            .social-button {
                color: #fff;
                text-decoration: none;
                display: block;
                margin-bottom: 5px;
                transition: background-color 0.3s;
                padding: 5px 10px;
                border-radius: 5px;
            }
            .instagram:hover {
                background-color: #e4405f;
            }
            .linkedin:hover {
                background-color: #0077b5;
            }
            .developed-by {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 10px 0;
            }
        </style>
    </head>
    <body>
        <footer>
            <div class="footer">
                <div class="partition">
                    <h3>About Us</h3>
                    <p>Ecommerce Website.</p>
                </div>
                <div class="partition">
                    <h3>Contact</h3>
                    <p>Email: gruheshkurra2@gmail.com</p>
                    <p>Phone: +91 8008258065</p>
                </div>
                <div class="partition">
                    <h3>Services</h3>
                    <p>Service 1</p>
                    <p>Service 2</p>
                </div>
                <div class="partition">
                    <h3>Products</h3>
                    <p>Product 1</p>
                    <p>Product 2</p>
                </div>
                <div class="partition">
                    <h3>Social Media</h3>
                    <div class="social-buttons">
                        <a href="#" class="social-button instagram">Instagram</a>
                        <a href="#" class="social-button linkedin">LinkedIn</a>
                    </div>
                </div>
            </div>
            <div class="developed-by">
                Developed by Karthik.
            </div>
        </footer>
    </body>
</html>
