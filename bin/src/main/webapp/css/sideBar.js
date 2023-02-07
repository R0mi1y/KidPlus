const toggleButton = document.querySelector('.bt1');
const toggleButton2 = document.querySelector('.bt2');
const sidebar = document.querySelector('#sidebar');
const container = document.querySelector('.container')

toggleButton.addEventListener('click', function(event) {
    event.preventDefault();
    if (sidebar.classList == 'hidden') {
        document.querySelector('.notTg.btn-menu-img.btn#minimizar').textContent = '↞';
    } else {
        document.querySelector('.notTg.btn-menu-img.btn#minimizar').textContent = '↠';
    }
    sidebar.classList.toggle('hidden');
    toggleButton.classList.toggle('hidden');
    container.classList.toggle('hidden');
});

toggleButton2.addEventListener('click', function(event) {
    event.preventDefault();
    if (sidebar.classList == 'hidden') {
        document.querySelector('.notTg.btn-menu-img.btn#minimizar').textContent = '↞';

    } else {
        document.querySelector('.notTg.btn-menu-img.btn#minimizar').textContent = '↠';
    }
    sidebar.classList.toggle('hidden');
    container.classList.toggle('hidden');
    toggleButton.classList.toggle('hidden');
});
