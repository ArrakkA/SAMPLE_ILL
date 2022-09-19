/** 옵션을 생성하는 함수*/
function optionMake(){
    yearMake();
    monthMake();
    dayMake();
    $('#birth-month').change(function(){
        dayMake();
    })
    $('#birth-year').change(function(){
        dayMake();
    })
    function dayMake(){
        $('#birth-day').empty();
        const targetYear = $('#birth-year').val();
        const targetMonth = $('#birth-month').val();
        const lastDate = new Date(targetYear, targetMonth, 0);
        const lastDay = lastDate.getDate();

        for(i=1; i<=lastDay; i++){
            const op= $("<option>" + i + "</option>");
            (i < 10)? j ="0"+ i : j = i;
            op.attr('value', j);
            $('#birth-day').append(op);
        }
    }//day 만들기
    function yearMake(){
        const today = new Date();
        const year = today.getFullYear();

        $('#birth-year').empty();
        for(i=year-100; i<=year; i++){
            const op= $("<option>" + i + "</option>");
            op.attr('value', i);
            $('#birth-year').append(op);
        }
    }//year 만들기
    function monthMake(){
        $('#birth-month').empty();
        for(i=1; i<=12; i++){
            const op= $("<option>" + i + "</option>");
            (i < 10)? j ="0"+ i : j = i;
            op.attr('value', j);
            $('#birth-month').append(op);
        }

    }//month 만들기
}// option 만들기
