
//변수
let yesNoModal;
let searchModal;

//변수 끝


//네비게이션 누를때 실행될 액션
function clickMenu(menu){
    $("a.active").removeClass("active");

    const $menu = $(menu);

    $menu.addClass("active");
}

