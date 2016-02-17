<!DOCTYPE html>
<html>

  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <!--<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="jquery/jquery.autocomplete.min.js"></script>
        -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://cdl.ddns.net:4098/mycss.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>
        
  <body>
    <div class="container">
                        <div class="jumbotron">
                        <h1>CDL Capital</h1>
                        <h5>Welcome to your profile, ${ username }$</h5>
</br>
                                <ul class="nav nav-pills">
                                <li class="active"><a href=${home_link}$>My Profile</a></li>
                                <li><a href=${home_link}$>Analysis</a></li>
                                <li><a href=${login_link}$>Logout</a></li>
                                </ul>
                        </div>

                        <ul class ="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Portfolio</a></li>
                            <li><a data-toggle="tab" href="#menu1">Transactions</a></li>
                        </ul>

                        <div class="tab-content">
                                <div id="menu1" class="tab-pane fade">
</br>
</br>
                                        <div class="row">
                                                <form id="deposit_form" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-1">
                                                                        <h3>Deposit</h3>
                                                                </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-1" for="amount">Amount:</label>
                                        <div class="col-sm-3">
                                                                    <input class="form-control" type="number" min="0" id="amount" type="text" name="amount" />
                                                                </div>
                                                        </div>
                                                        <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-1">
                                                                    <input class="form-control" id="deposit" type="button" value="Submit" onclick="Deposit();"/>
                                                                </div>
                                                        </div>
                                                </form>
                                                <div id="deposit_status"></div>
                                        </div>

                                        <div class="row">
                                                <form id="buy_form" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-1">
                                                                        <h3>Buy</h3>
                                                                </div>
                                                        </div>
                                                        <div class="form-group">
                                                                <label class="control-label col-sm-1" for="company_name_buy">Company</label>
                                                                <div class="col-sm-3">
                                                                        <input class="form-control"  id="company_name_buy" type="text" name="company_name" />
                                                                </div>
                                                        </div>
                                                        <div class="form-group">
                                                                <label class="control-label col-sm-1" for="volume_buy">Volume:</label>
                                                                <div class="col-sm-3">
                                                                        <input class="form-control"  type="number" min="0" id="volume_buy" type="number" name="volume_buy" />
                                                                </div>
                                                        </div>
                                                        <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-1">
                                                                        <input class="form-control" id="Buy" type="button" value="Submit" onclick="buy();"/>
                                                                </div>
                                                        </div>
                                                </form>
                                                <div id="outputbox"><p id="outputcontent"></p></div>
                                                <div id="buy_status"></div>
                                        </div>

                                        <div class="row">
                                                <form class="sell_form form-horizontal" id="sell_form" role="form">
                                                        <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-1">
                                                                        <h3>Sell</h3>
                                                                </div>
                                                        </div>
                                                        <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-1">
                                                                <select id="company_name_sell" name="company_name_sell"></select>
                                                        </div>
                                                </div>
                                                <div class="form-group">
                                                        <label class="control-label col-sm-1" for="volume_sell">Volume:</label>
                                                        <div class="col-sm-3">
                                                                <input class="form-control" type="number" min="0" id="volume_sell" type="number" name="volume_sell" />
                                                        </div>
                                                </div>
                                                <div class="form-group">
                                                        <div class="col-sm-offset-1 col-sm-1">
                                                                        <input class="form-control" id="Sell" type="button" value="Submit" onclick="sell();"/>
                                                                </div>
                                                        </div>
                                        </form>
                                        </div>
</br>
</br>
</br>
                                </div>
<br/>
<br/>
                                <div id="home" class="tab-pane fade in active">
                                        <div class="row">
                                        <div class="col-sm-4" sidenav>
                                                <h4>Portfolio Information</h4>
                                                <table class="table table-hover user_table">
                                        <thead>
                                                                <tr>
                                                                    <th>Total Portfolio</th>
                                                                    <th>Available Funds</th>
                                                                    <th>Total Stock Values</th>
                                                                    <th>Total Profit</th>
                                                                    <th>Total Deposited</th>
                                                                </tr>
                                        </thead>
                                                    </table>
<br>
<br>
                                                <div id="user_information"></div>

                                                <h4>Owned Stocks</h4>
						<div class="col-sm-12">
						<div style= "overflow:auto; height:350px;">
                                                <table class="table table-hover owned_stocks_table">
                                                                <thead>
                                            <tr>
                                                                    <th>Stock</th>
                                                                    <th>Shares</th>
                                                                    <th>Current Price</th>
                                                                    <th>Total Worth</th>
                                                                    <th>Profit</th>
                                                                </tr>
                                        </thead>
                                                </table>
						</div>
						</div>
<br>
<br>
                                                <div id="owned_stocks_information"></div>
                                        </div>
                                        <div class="col-sm-8">
                                                        <div id="piechart" style="width: 900px; height: 500px;"></div>
                                                </div>
                                </div>
<br>
<br>
                                <div class="row" >

					<h4>Recent Transactions</h4>
				
					<div class="col-sm-6">  
					<div style= "overflow:auto; height:500px;">
                                                <table class="table table-hover transaction_table" >
                                                <thead><tr>
                                                    <th>Transaction Date </th>
                                                    <th>Transaction Type</th>
                                                    <th>Stock</th>
                                                    <th>Price</th>
                                                    <th>Volume</th>
                                                    <th>Total Price</th>
                                                </tr></thead>
                                                </table>
					</div>
					</div>
<br>
<br>
                                                <div id="transaction_information"></div>
                                        </div>
                                </div>
<br/>
<br/>
                </div>
        </div>

    <script type="text/javascript">

      var intervalId = null;
      window.onload = start;

      function start()
      {
          generate_sell_drop_down();
          update_profile_information();
          intervalId = setInterval(update_profile_information, 60000);
      }

        function update_profile_information()
        {
                var update_profile_result = $.ajax({
                        type: 'POST',
                        url: '${upload_link}$',
                        data: 'username='+ '${username}$',
                        dataType: "json",
                        async: false}).responseText;

      		var json_obj=JSON.parse(update_profile_result);
      		console.log(json_obj);
                table_generate_users(json_obj['users']);
                table_generate_transactions(json_obj['transactions']);
                table_generate_owned_stocks(json_obj['owned_stocks']);
                drawChart();
                //load_profile_information();
        }

        function table_generate_owned_stocks (json_obj)
        {
                $('.owned_stocks_table tr td').remove();
                var tb = document.createElement("tbody");		
		                
		for (i in json_obj)
                {
                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td");
                        var td2 = document.createElement("td");
                        var td3 = document.createElement("td");
                        var td4 = document.createElement("td");
                        var td5 = document.createElement("td");

                        var t1 = document.createTextNode(json_obj[i]['stock']);
                        td1.appendChild(t1);
                        var t2 = document.createTextNode(json_obj[i]['current_shares']);
                        td2.appendChild(t2);
                        var t3 = document.createTextNode(json_obj[i]['current_price']);
                        td3.appendChild(t3);
                        var t4 = document.createTextNode(json_obj[i]['total_worth']);
                        td4.appendChild(t4);
                        var t5 = document.createTextNode(json_obj[i]['profit']);
                        td5.appendChild(t5);

                        tr.appendChild(td1);
                        tr.appendChild(td2);
                        tr.appendChild(td3);
                        tr.appendChild(td4);
                        tr.appendChild(td5);

                        tb.appendChild(tr);
                }
		
                var $formrow = tb
                $('.owned_stocks_table').append($formrow);
	
        }

        function table_generate_transactions (json_obj)
        {
                $('.transaction_table tr td').remove();
                var tb = document.createElement("tbody");

                for (i in json_obj)
                {

                        var tr = document.createElement("tr");
                        var td1 = document.createElement("td");
                        var td2 = document.createElement("td");
                        var td3 = document.createElement("td");
                        var td4 = document.createElement("td");
                        var td5 = document.createElement("td");
                        var td6 = document.createElement("td");

                        var t1 = document.createTextNode(json_obj[i]['trans_date']);
                        td1.appendChild(t1);
                        var t2 = document.createTextNode(json_obj[i]['trans_type']);
                        td2.appendChild(t2);
                        var t3 = document.createTextNode(json_obj[i]['stock']);
                        td3.appendChild(t3);
                        var t4 = document.createTextNode(json_obj[i]['price']);
                        td4.appendChild(t4);
                        var t5 = document.createTextNode(json_obj[i]['volume']);
                        td5.appendChild(t5);
                        var t6 = document.createTextNode(json_obj[i]['total_price']);
                        td6.appendChild(t6);

                        tr.appendChild(td1);
                        tr.appendChild(td2);
                        tr.appendChild(td3);
                        tr.appendChild(td4);
                        tr.appendChild(td5);
                        tr.appendChild(td6);

                        tb.appendChild(tr);
                }

                var $formrow = tb;
                $('.transaction_table').append($formrow);
       		
	 }



        function table_generate_users (json_obj)
        {
                var tb = document.createElement("tbody");
                var tr = document.createElement("tr");

                var td1 = document.createElement("td");
                var td2 = document.createElement("td");
                var td3 = document.createElement("td");
                var td4 = document.createElement("td");
                var td5 = document.createElement("td");

                var t1 = document.createTextNode(json_obj['total_portfolio']);
                td1.appendChild(t1);
                var t2 = document.createTextNode(json_obj['available_funds']);
                td2.appendChild(t2);
                var t3 = document.createTextNode(json_obj['total_stock_values']);
                td3.appendChild(t3);
                var t4 = document.createTextNode(json_obj['profit']);
                td4.appendChild(t4);
                var t5 = document.createTextNode(json_obj['total_deposited']);
                td5.appendChild(t5);

                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);
                tr.appendChild(td4);
                tr.appendChild(td5);

                tb.appendChild(tr);

                var $formrow = tb;

                $('.user_table tr td').remove();
                $('.user_table').append($formrow);
        }

        function Deposit()
        {
                var amount=document.getElementById('amount');

                if(amount.value > 0)
                {
                        var deposit_result = $.ajax({
                                type: 'POST',
                                url: '${deposit_link}$',
                                data: 'username='+ '${username}$' + '&amount='+ amount.value,
                                dataType: "datastring",
                                async: false}).responseText;

                  document.getElementById('deposit_status').innerHTML = deposit_result;
                  update_profile_information();
                }
      
                document.getElementById("deposit_form").reset();
        }

        function buy()
        {
            var company_name=document.getElementById('company_name_buy');
            var volume=document.getElementById('volume_buy');

                if(volume.value > 0)
                {
                        var buy_result = $.ajax({
                                type: 'POST',
                                url: '${transaction_link}$',
                                data: 'username='+ '${username}$' + '&company='+ company_name.value + '&volume='+ volume.value + '&trans_type=buy',
                                dataType: "json",
                                async: false}).responseText;
		        //console.log(buy_result)
                    update_profile_information();
                }
                generate_sell_drop_down();
                document.getElementById("buy_form").reset();
        }
      
        function sell()
        {
                var company_name=company_name_sell.value;
                var volume=document.getElementById('volume_sell');
                
                if(volume.value > 0)
                {
                        var sell_result = $.ajax({
                                type: 'POST',
                                url: '${transaction_link}$',
                                data: 'username='+ '${username}$' + '&company='+ company_name + '&volume='+ volume.value + '&trans_type=sell',
                                dataType: "json",
                                async: false}).responseText;

                        update_profile_information();
                }
                //console.log(sell_result);
                document.getElementById("sell_form").reset();
                //generate_sell_drop_down();
                
      }
     
        function generate_sell_drop_down()
        {
                var user_name="${username}$";
                var generate_sell_drop_down="generate_sell_drop_down";
                var generate_sell_drop_down_parsed = [];

                var generate_sell_drop_down_result = $.ajax({
                        type: 'POST',
                        url: "${dropdown_link}$",
                        data: 'user_name='+ user_name + '&sell_companies_list='+ generate_sell_drop_down,
                        dataType: "json",
                        async: false}).responseText;

                //console.log(generate_sell_drop_down_result);
                generate_sell_drop_down_parsed=JSON.parse(generate_sell_drop_down_result);
                //console.log(generate_sell_drop_down_parsed);
                $('#company_name_sell').empty();
                $('<option value="Companies"> Companies </option>').appendTo('#company_name_sell');
            for(var field in generate_sell_drop_down_parsed) {
                 $('<option value="'+ generate_sell_drop_down_parsed[field]['stock'] +'">' + generate_sell_drop_down_parsed[field]['stock'] + '</option>').appendTo('#company_name_sell');
            }
        }

        /*function load_profile_information()
        {
                var user_name='<?php echo $user_check; ?>';
                var profile_information="profile_information";
                profile_info_result = $.ajax({
                        type: 'POST',
                        url: "http://cdl.ddns.net:4098/CDLCapital/Front/router/front_router.php",
                        data: 'user_name='+ user_name + '&profile_information='+ profile_information,
                        dataType: "json",
                        async: false}).responseText;

                var profile_info_result_parsed=JSON.parse(profile_info_result);
                //console.log(profile_info_result_parsed[2]);
                table_generate_users(profile_info_result_parsed[0]);
                table_generate_transactions(profile_info_result_parsed[1]);
                table_generate_owned_stocks(profile_info_result_parsed[2]);
                drawChart();
        };*/

</script>

<script type="text/javascript">

    var flag=true;
    var counter=0;
    function drawChart()
    {
        counter=counter+1;

        if(counter>1)
        {
                flag=false;
        }

        var user_name="${username}$";
        var portfolio_distribution ="portfolio_distribution";

        var portfolio_distribution = $.ajax({
                        type: 'POST',
                        url: "${portfolio_link}$",
                        data: 'user_name='+ user_name + '&portfolio_distribution='+ portfolio_distribution,
                        dataType: "json",
                        async: false}).responseText;
		//console.log(portfolio_distribution)
                portfolio_distribution_parsed=JSON.parse(portfolio_distribution);
		//console.log(portfolio_distribution_parsed)
        $(function () {
                $('#piechart').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Portfolio Distribution'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                     pie: {
                        animation: flag,
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
                },
                series: [{
                    name: 'Stocks',
                    colorByPoint: true,
                    data: portfolio_distribution_parsed
                }]
            });
        });
    }
</script>

        </body>
	
</html>


