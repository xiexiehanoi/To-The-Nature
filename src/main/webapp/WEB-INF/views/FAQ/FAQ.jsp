<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap">;
<script	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
body {
    font-family: 'Roboto', sans-serif;
    /* background-color: #F0F2F5; */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.accordion-container {
    width: 80%;
    max-width: 600px;
}

.accordion-item {
    background-color: #FFFFFF; /* White background for items */
    border: 1px solid #E0E0E0; /* Light border */
    border-radius: 8px;
    margin-bottom: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Softer shadow */
}

.accordion-header {
    background-color: #6C63FF; /* Soft purple */
    color: #FFFFFF; /* White text */
    padding: 15px;
    font-size: 18px;
    border: none;
    width: 100%;
    text-align: left;
    cursor: pointer;
    outline: none;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-radius: 8px 8px 0 0;
    transition: background-color 0.3s ease;
}

.accordion-header:hover {
    background-color: #5753C9; /* Darker shade of purple */
}

.accordion-content {
    background-color: #FAFAFA; /* Very light grey for content */
    overflow: hidden;
    padding: 0 15px;
    max-height: 0;
    transition: max-height 0.3s ease;
}

.accordion-content p {
    margin: 15px 0;
    line-height: 1.5;
}

.icon {
    transition: transform 0.3s ease;
}

.active .icon {
    transform: rotate(45deg);
}

</style>
<script type="text/javascript">
document.querySelectorAll('.accordion-header').forEach(button => {
    button.addEventListener('click', () => {
        const accordionContent = button.nextElementSibling;

        button.classList.toggle('active');

        if (button.classList.contains('active')) {
            accordionContent.style.maxHeight = accordionContent.scrollHeight + 'px';
        } else {
            accordionContent.style.maxHeight = 0;
        }

        // Close other open accordion items
        document.querySelectorAll('.accordion-header').forEach(otherButton => {
            if (otherButton !== button) {
                otherButton.classList.remove('active');
                otherButton.nextElementSibling.style.maxHeight = 0;
            }
        });
    });
});
</script>
<body>
  <div class="accordion-container">
        <div class="accordion-item">
            <button class="accordion-header">
                FAQ Question 1 <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>Answer to question 1...</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-header">
                FAQ Question 2 <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>Answer to question 2...</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-header">
                FAQ Question 3 <span class="icon">+</span>
            </button>
            <div class="accordion-content">
                <p>Answer to question 3...</p>
            </div>
        </div>
    </div>
</body>
</html>