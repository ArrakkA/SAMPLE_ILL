/** 팝업창 만드는 함수*/
function quickPopup(){
    const url = "popup";
    const name = "popup test";
    const option = "width = 500, height = 500, top = 100, left = 200, location = no";
    window.open(url, name, option);
}
$(document).ready(function (){
    $('#quickReservation').click(function(){
        quickPopup();
    });
})

