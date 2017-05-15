$(function () {
    var $username = $('#username');
    var $password = $('#password');
    var $confirmPwd = $('#confirmPwd');
    var $phoneNo = $('#phoneNo');
    var type = $('form').data('type') || 'login';
    var form = {
        getLoginFormData: function () {
            var data = {
                loginName: $.trim($username.val()),
                loginPwd: $.trim($password.val())
            };
            return data;
        },
        getRegisterFormData: function () {
            var data = {
            	userName: $.trim($username.val()),
            	password: $.trim($password.val()),
            	phoneNo:  $.trim($phoneNo.val()),
            };
            return data;
        },
        events: function () {
            var self = this;
            var formField = [$username, $password,$confirmPwd,$phoneNo];
            for (var i = 0; i < formField.length; i++) {
                formField[i].on('blur', function () {
                    self.validator($(this));
                });
            }
            $confirmPwd.on('blur', function () {
                var confirmPwd = $.trim($(this).val());
                var pwd = $.trim($password.val());
                var $parents = $(this).parents('.input-group');
                var $msgEl = $parents.next('.help-block');
                if (confirmPwd !== pwd && pwd) {
                    self.showMsg($msgEl, '请确认两次密码输入一致');
                    $parents.addClass('has-error');
                }
                else {
                    self.showMsg($msgEl, '');
                    $parents.removeClass('has-error');
                }
            });
            $('#btnLogin, #btnRegister').click(function (e) {
                var isPass = true;
                $('form .form-control').each(function () {
                    var $el = $(this);
                    if (!self.validator($el)) {
                        isPass = false;
                    }
                });
                if (isPass) {
                    $.ajax({
                        type: 'POST',
                        url: (type === 'login') ? '/login/checkLogin' : '/login/register',
                        data: (type === 'login') ? form.getLoginFormData() : form.getRegisterFormData(),
                        dataType: 'json',
                        success: function (resp) {
                            if (+resp.code === 1) {
                                window.location = (type === 'login') ? '/book/bookList' : '/login/login';              
                            } else {
                                self.showMsg($('#fromMsg'), resp.msg);
                            }
                        }
                    });
                }
                e.preventDefault();
            });
        },
        validator: function ($el) {
            var text = $.trim($el.val());
            var isPass = false;
            var $inputgroup = $el.parents('.input-group');
            var $msgEl = $el.parents('.input-group').next('.help-block');
            if (!text) {
                var msg = '请输入' + $el.attr('placeholder');
                $el.parents('.input-group').addClass('has-error')
                this.showMsg($msgEl, msg);
            }
            else {
                $el.parents('.input-group').removeClass('has-error')
                this.showMsg($msgEl, '');
                isPass = true;
            }
            return isPass;
        },
        showMsg: function ($el, msg) {
            $el.text(msg);
        }
    };
    form.events();
});