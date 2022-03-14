var swiper = new Swiper(".mySwiper", {
    slidesPerView: 7,
    spaceBetween: 30,
    freeMode: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    breakpoints: {
        320: {
            slidesPerView: 2,
        },
        700: {
            slidesPerView: 3,
        },
        1000: {
            slidesPerView: 4,
        },
        1200: {
            slidesPerView: 5,
        },
        1400: {
            slidesPerView: 6,
        }
    },
});

// Authors swiper
var swiper = new Swiper(".authorsSwiper", {
    slidesPerView: 7,
    spaceBetween: 30,
    freeMode: true,
    breakpoints: {
        320: {
            slidesPerView: 2,
        },
        700: {
            slidesPerView: 4,
        },
        1000: {
            slidesPerView: 5,
        },
        1200: {
            slidesPerView: 6,
        },
        1400: {
            slidesPerView: 8,
        }
    },
});