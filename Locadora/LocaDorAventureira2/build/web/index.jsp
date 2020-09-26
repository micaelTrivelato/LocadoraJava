<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"></link>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .menu ul {
                padding-left:18%;
                margin:0px;
                background-color:#EDEDED;
                list-style:none;
            }
            .menu ul li { display: inline; }
            .menu ul li a {
                padding: 2px 5%;
                display: inline-block;

                /* visual do link */
                background-color:#EDEDED;
                color: #333;
                text-decoration: none;
                border-bottom:3px solid #EDEDED;
            }
            .menu ul li a:hover {
                border-bottom:3px solid black;
            }
            .espacamento{
                margin-top: 10%;
            }
            .colorir{
                box-shadow: inset 0 0 1em blue, 0 0 1em blue;
                border-radius: 30px;
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("susuario") != null) {
                response.sendRedirect("PaginaInicial.jsp");
            }
        %>
        <div class="espacamento" align='center'>
            <div class="card col-7 colorir">
                <h1 class="mt-3">Faça seu Login</h1>
                <form method="post" action="validar.jsp">
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Usuário:</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="staticEmail" placeholder="Insira seu usuário" required="true" name="usuario">
                        </div>
                    </div>
                    <div class="form-group row mt-4">
                        <label for="staticEmail" class="col-sm-2 col-form-label ml-3">Senha:</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" id="staticEmail" placeholder="Insira sua senha" required="true" name="senha">
                        </div>
                    </div>
                    <button class='btn btn-primary mb-3 mt-4 btnCadastrar' type="submit">Entrar</button>                    
                </form>
            </div>
        </div>
    </body>
</html>

