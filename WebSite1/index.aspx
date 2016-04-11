<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () {
                var person1 = new Object();
                person1.Name = "李忠鍵";
                person1.Age = 20;
                var my_array = [];
                my_array.push(person1);

                $.ajax({
                    url: './Handler2.ashx',
                    data:{ array: JSON.stringify(my_array)},
                    type: 'get',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        alert(data[0].Name);
                    },
                    error: function () {
                        alert('掰掰');
                    }
                });

            });
        });

    </script>
    <title></title>
</head>
<body>
    <input id="Button1" type="button" value="button" />

    <!--<form method="post" action="./index2.aspx">
         First name: <input type="text" name="fname"/>/br/>
         Last name: <input type="text" name="lname"/><br/>
        <button type="submit">寄</button>
    </form>-->
</body>
</html>
