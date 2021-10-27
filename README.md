# webapi-Globaltec

Projeto de webapi desenvolvido no Visual Studio 2019, com:

  > .NET 5.0
  > Entity Framework Core
  > JTW (Autenticação)
  > Swagger
  > Postman (testes) 
  > PostgreSQL (banco de dados)

# ROTAS

Registro e obtenção do token
POST /api/Authorize/Register (Exemplo de senha: Teste@123)

Cadastrar uma pessoa:
POST /api/Peoples (UF com o máximo de 2 caracteres)

Obter lista de pessoas:
GET /api/Peoples

Obter lista de pessoas por UF:
GET /api/Peoples/uf={uf}

Obter pessoa pelo ID:
GET /api/Peoples/{id}

Modificar dados de uma pessoa pelo ID:
PUT /api/Peoples/{id} (lembrando que o ID tem que ser o mesmo na hora de alterar)

Deletar uma pessoa pelo ID:
DELETE /api/Peoples/{id}

Video de demonstração: https://www.youtube.com/watch?v=jnvErsP0SuY
