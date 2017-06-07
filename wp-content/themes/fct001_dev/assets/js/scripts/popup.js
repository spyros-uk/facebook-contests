$(document).ready(() => {
	"use strict";

	const galleries = $('[data-popup-gallery]');

	if (galleries.length)
	    initPopup(galleries);
});

function initPopup(galleries) {
    Array.from(galleries).forEach(gallery => {
        $(gallery).magnificPopup({
            delegate: 'a',
            type: 'image',
            closeOnBgClick: true,
            gallery: {
                enabled: true
            }
        });
    });
}

function getImageSources(images) {
    Array.from(images).forEach(image => {
        console.log(image);
    });
}

/*
.magnificPopup({
    delegate: 'a',
    type: 'image',
    gallery: {
        enabled: true,
        tPrev: 'Previous',
        tNext: 'Next',
        arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%">%title%</button>'
    },
    showCloseBtn: true,
    closeBtnInside: false,
    closeOnContentClick: false,
    closeOnBgClick: true,
    closeMarkup: '<button title="%title%" type="button" class="mfp-close"></button>',
    callbacks: {
        open: () => {
            body.addClass('site__body--fixed');
        },
        close: () => {
            body.removeClass('site__body--fixed');
        }
    }
});*/
