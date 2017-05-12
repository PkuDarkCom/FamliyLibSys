<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="/static/asset/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            redirect();
        });
        function redirect() {
            parent.window.location.href = "/login/login";
        }
    </script>
</head>
</html>