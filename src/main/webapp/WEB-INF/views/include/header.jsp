<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Green IT</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="/css/bootstrap.css">
<script src="/js/bootstrap.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="shortcut icon" href="#">
<script>
    $(document).ready(function(){
        $('#Progress_Loading').hide();
        $(document).ajaxStart(function (){
            $('#Progress_Loading').show();
         });
         $(document).ajaxStop(function (){
            $('#Progress_Loading').hide();
        });
    });
</script>
<style>
	.p-r10{
		
		padding-right:10px
	}
	.w100{
	
		width : 100px
	}
	
	.w300{
	
		width : 300px	
	}
	#Progress_Loading
	{
        display: none;
        position:fixed;
        width: 100%;
        height: 100%;
        top:0;
        left:0;
        background:rgba(0,0,0,0.5);
	}
    body
    {
        text-align: center;
        margin: 0 auto;
    }
    #Progress_Img
    {
        position: absolute;
        left: 50%;
        top: 50%;
        background: #ffffff;
    }
    .red{
        color:red;
    }
</style>