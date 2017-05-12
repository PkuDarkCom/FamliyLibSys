$(function () {
    var $username = $('#username');
    var $password = $('#password');
    var form = {
        getFormData: function () {
            return {
                login_name: $.trim($username.val()),
                login_pwd: $.trim($password.val())
            }
        },
        events: function () {
            var self = this;
            $username.on('blur', function () {
                self.validator($(this));
            });
            $password.on('blur', function () {
                self.validator($(this));
            });
            $('#btnLogin').click(function (e) {
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
                        url: '/login/checkLogin',
                        data: form.getFormData(),
                        dataType: 'json',
                        success: function (resp) {
                            if (+resp.code === 1) {
                                window.location = '/index';              
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