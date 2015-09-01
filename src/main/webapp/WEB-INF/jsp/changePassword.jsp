<html>
<head>
<title>Schedule to Reddit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
<div th:include="header"/>

<div class="container">
<h1>Change Password</h1>
    <div id="errormsg" class="alert alert-danger" style="display:none"></div>
            <div >
                <br/>
                
                    <label class="col-sm-2">Old Password</label>
                    <span class="col-sm-5"><input class="form-control" id="oldpass" name="oldpassword" type="password" value="" required="required"/></span>
                    <span class="col-sm-5"></span>
<br/><br/>         
                    <label class="col-sm-2">New Password</label>
                    <span class="col-sm-5"><input class="form-control" id="pass" name="password" type="password" value="" required="required"/></span>
                    <span class="col-sm-5"></span>
<br/><br/>
                    <label class="col-sm-2">Confirm Password</label>
                    <span class="col-sm-5"><input class="form-control" id="passConfirm" type="password" value="" required="required"/></span>
                    <span id="error" class="alert alert-danger" style="display:none">Password Mismatch</span>
                   
                <br/><br/>
                <button class="btn btn-primary" type="submit" onclick="savePass()">Save</button>
            </div>
            
        </div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
function savePass(){
	var oldPass = $("#oldpass").val();
    var pass = $("#pass").val();
    var confirmPass = $("#passConfirm").val();
    if(pass.length == 0 || confirmPass.length==0 || oldPass.length == 0){
    	$("#errormsg").show().html("Please fill all the fields required");
    	return;
    }
    var valid = pass == confirmPass;
    if(!valid) {
      $("#error").show();
      return;
    }
    $.post("./user/changePassword",{password: pass, oldpassword: oldPass} ,function(data){
            window.location.href = "./";
    })
    .fail(function(data) {
    	$("#errormsg").show().html(data.responseText);
    });
}
</script>  
</body>

</html>