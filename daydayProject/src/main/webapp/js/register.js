$(function () {

    var error_name = true;
    var error_password = true;
    var error_check_password = true;
    var error_email = true;
    var error_check = true;


    $('#user_name').blur(function () {
        check_user_name();
    });

    $('#pwd').blur(function () {
        check_pwd();
    });

    $('#cpwd').blur(function () {
        check_cpwd();
    });

    $('#email').blur(function () {
        check_email();
    });

    $('#allow').click(function () {
        if ($(this).is(':checked')) {
            error_check = false;
            $(this).siblings('span').hide();
        } else {
            error_check = true;
            $(this).siblings('span').html('请勾选同意');
            $(this).siblings('span').show();
        }
    });


    function check_user_name() {
        var len = $('#user_name').val().length;
        if (len < 5 || len > 20) {
            $('#user_name').next().html('请输入5-20个字符的用户名')
            $('#user_name').next().show();
            error_name = true;
        } else {
            $.get("user/queryHasUsername", {username: $('#user_name').val()}, function (data) {
                var data = JSON.parse(data);
                if (data.msg == 'yes') {
                    error_name = true;
                    $('#user_name').next().html('用户名已存在')
                    $('#user_name').next().show();
                } else {
                    $('#user_name').next().html('用户名可用').css("color", "blue");
                    $('#user_name').next().show();
                    error_name = false;
                }
            }, "json")

        }
    }

    function check_pwd() {
        var len = $('#pwd').val().length;
        if (len < 8 || len > 20) {
            $('#pwd').next().html('密码最少8位，最长20位')
            $('#pwd').next().show();
            error_password = true;
        } else {
            $('#pwd').next().hide();
            error_password = false;
        }
    }


    function check_cpwd() {
        var pass = $('#pwd').val();
        var cpass = $('#cpwd').val();

        if (pass != cpass) {
            $('#cpwd').next().html('两次输入的密码不一致')
            $('#cpwd').next().show();
            error_check_password = true;
        } else {
            $('#cpwd').next().hide();
            error_check_password = false;
        }

    }

    function check_email() {
        var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

        if (re.test($('#email').val())) {
            $('#email').next().hide();
            $.get("user/queryHasEmail", {email: $('#email').val()}, function (data) {
                var data = JSON.parse(data);
                if (data.msg == 'yes') {
                    error_email = true;
                    $('#email').next().html('邮箱已被利用')
                } else {
                    $('#email').next().hide();
                    error_email = false;
                }
            }, "json")
        } else {
            $('#email').next().html('你输入的邮箱格式不正确')
            $('#email').next().show();
            error_email = true;
        }

    }

    $("#submitButton").click(function () {

        // check_user_name();
        // check_pwd();
        // check_cpwd();
        // check_email();
        if (error_check == true) {
            $('.error_tip2').html('请勾选同意').show();
            return;
        }
        if (error_name == false && error_password == false && error_check_password == false && error_email == false && error_check == false) {
            var username = $("#user_name").val();
            var password = $("#pwd").val();
            var email = $("#email").val();

            $.ajax({
                type: "post",
                url: "user/register",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify({username: username, password: password, email: email}),
                success: function (data) {
                    var data = JSON.parse(data)
                    if (data.msg == 'ok') {
                        alert("注册成功");
                        location.href = "login.jsp";
                    } else {
                        $("#submitButton").after("<span style='color: red'>" + data.msg + "</span>")
                    }
                }
            })
            return true;
        } else {
            $("#submitButton").after("<span style='color: red'>表单中有不符合的情况</span>")
            return false;
        }
    })

    /*	$('#reg_form').submit(function() {
            check_user_name();
            check_pwd();
            check_cpwd();
            check_email();

            if(error_name == false && error_password == false && error_check_password == false && error_email == false && error_check == false)
            {
                return true;
            }
            else
            {
                return false;
            }

        });*/


})