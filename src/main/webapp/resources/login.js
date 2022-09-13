$(document).ready(function(){
    $('#loginBtn').on("click", function(e){
        const memId = $('#mem_id').val();
        const memPw = $('#mem_pw').val();
        const autoLoginChk = $('#autoLogin').prop("checked");
        const params = {};
        console.log(autoLoginChk);
        if(autoLoginChk){
            params["autoLoginChk"] = 'Y'
        }else{
            params["autoLoginChk"] = 'N'
        }
        console.log(params);
        if(memId == "") {
            alert("아이디를 입력하세요.")
            return;
        } else {
            params["id"] = memId;
        }
        if(memPw == "") {
            alert("비밀번호를 입력하세요");
            return;
        } else {
            params["pw"]= memPw;
        }
        $.ajax({
            type:'post',
            url:'/member/login',
            dataType:'JSON',
            data:params,
            success: function(data) {
                if(data.code === '0000') {
                    alert('로그인에 성공하였습니다');
                    location.href="/sample/home";
                } else if(data.code === '1111'){
                    alert('아이디 및 비밀번호가 일치하지 않습니다');
                } else {
                    alert('오류입니다.');
                }
            },
            error:function (request, status, error) {
                console.log('error');
            }
        })
    })
})