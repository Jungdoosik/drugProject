<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	 body,html{
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    
    }

    .searchbar{
    margin-bottom: auto;
    margin-top: 40px;
    height: 60px;
    background-color: #353b48;
    border-radius: 30px;
    padding: 10px;
    }

    .search_input{
    color: white;
    border: 0;
    outline: 0;
    background: none;
    width: 0;
    caret-color:transparent;
    line-height: 40px;
    
    }

    .searchbar > .search_input{
    padding: 0 10px;
    width: 450px;
    caret-color:red;
    }

    .searchbar > .search_icon{
    
    color: #white;
    }

    .search_icon{
    height: 40px;
    width: 40px;
    float: right;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    color:white;
    text-decoration:none;
    }
    
    /* selectBox */
    .selectpicker{
/*     	border-radius: 30px; */
     	border:none;
     	border-radius: 0;
     	-webkit-appearance: none;
     	-monz-appearance: none;
     	appearance: none;
     	margin-top: 50px;
    }
    
    
</style>
<head>
    <title>search bar</title>
     <link rel="stylesheet" href="resources/css/search.css"> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

	<!-- select box -->
	<script type="text/javascript">
      window.onload=function(){
      $('.selectpicker').selectpicker();
      $('.rm-mustard').click(function() {
        $('.remove-example').find('[value=Mustard]').remove();
        $('.remove-example').selectpicker('refresh');
      });
      $('.rm-ketchup').click(function() {
        $('.remove-example').find('[value=Ketchup]').remove();
        $('.remove-example').selectpicker('refresh');
      });
      $('.rm-relish').click(function() {
        $('.remove-example').find('[value=Relish]').remove();
        $('.remove-example').selectpicker('refresh');
      });
      $('.ex-disable').click(function() {
          $('.disable-example').prop('disabled',true);
          $('.disable-example').selectpicker('refresh');
      });
      $('.ex-enable').click(function() {
          $('.disable-example').prop('disabled',false);
          $('.disable-example').selectpicker('refresh');
      });

      // scrollYou
      $('.scrollMe .dropdown-menu').scrollyou();

      prettyPrint();
      };
    </script>
	<!-- select box종료 -->
  </head>
<body>
	<!-- selectBox -->
		<div class="container">
	<div class="row">
<div class="bs-docs-example">
  <select class="selectpicker" data-style="btn-primary" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
  </select>
  <select class="selectpicker" data-style="btn-info" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
  </select>
  <select class="selectpicker" data-style="btn-success" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
  </select>
  <select class="selectpicker" data-style="btn-warning" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
  </select>
  <select class="selectpicker" data-style="btn-danger" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
  </select>
  <select class="selectpicker" data-style="btn-inverse" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
  </select>
      
  </div>
<div class="bs-docs-example">
  <select class="selectpicker" multiple="" style="display: none;">
    <option>Mustard</option>
    <option>Ketchup</option>
    <option>Relish</option>
  </select>
</div>
<select class="selectpicker" data-show-subtext="true" style="display: none;">
        <option data-subtext="French's">Mustard</option>
        <option data-subtext="Heinz">Ketchup</option>
        <option data-subtext="Sweet">Relish</option>
        <option data-subtext="Miracle Whip">Mayonnaise</option>
        <option data-divider="true"></option>
        <option data-subtext="Honey">Barbecue Sauce</option>
        <option data-subtext="Ranch">Salad Dressing</option>
        <option data-subtext="Sweet & Spicy">Tabasco</option>
        <option data-subtext="Chunky">Salsa</option>
    </select>
    <select class="selectpicker" data-header="Select a condiment" style="display: none;">
        <option data-subtext="French's">Mustard</option>
        <option data-subtext="Heinz">Ketchup</option>
        <option data-subtext="Sweet">Relish</option>
        <option data-subtext="Miracle Whip">Mayonnaise</option>
        <option data-divider="true"></option>
        <option data-subtext="Honey">Barbecue Sauce</option>
        <option data-subtext="Ranch">Salad Dressing</option>
        <option data-subtext="Sweet & Spicy">Tabasco</option>
        <option data-subtext="Chunky">Salsa</option>
    </select>
    <select class="selectpicker" data-size="5" style="display: none;">
      <option>Mustard</option>
      <option>Ketchup</option>
      <option>Relish</option>
      <option>Mayonnaise</option>
      <option>Barbecue Sauce</option>
      <option>Salad Dressing</option>
      <option>Tabasco</option>
      <option>Salsa</option>
  </select>
  <select class="selectpicker">
    
    <optgroup label="Camping">
      <option>Tent</option>
      <option>Flashlight</option>
      <option>Toilet Paper</option>
    </optgroup>
  </select>
<!--   <input type="text" class="keyword"></input> -->
	</div>
</div>
<!-- selectBox 종료 -->	

  <!-- search부분 -->
	<div class="container h-100">
	      <div class="d-flex justify-content-center h-100">
		        <div class="searchbar">
			          <input class="search_input" type="text" name="" placeholder="Search...">
			          <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
		        </div>
	      </div>
    </div>
  <!-- search부분 종료 -->  
</body>
</html>