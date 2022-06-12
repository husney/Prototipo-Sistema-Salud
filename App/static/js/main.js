(() => {

    const currentPage = window.location.pathname;    
    const refLink = document.querySelector(`a[data-target='${currentPage}']`);
    refLink.classList.add('c-active');
    
    if(!localStorage.getItem('current-user'))    
        window.location.href = `/login`;    
})();

var TOKEN = JSON.parse(localStorage.getItem('current-user'));