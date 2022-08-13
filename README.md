# README

## How to run the application:

1. First of all you have to create an account using this api of type **POST**

   `curl --location --request POST 'http://localhost:3000/user' \
   --form 'name="test"' \
   --form 'email="test@test.com"' \
   --form 'is_admin="false"' \
   --form 'password_digest="123123"' \
   --form 'username="test"'
   `

also please note that you need send the params as **form-data**.

you will get a **token** to validate your session

2. then You have to pass the `token` in `Authorization` header with the `login` api request:

   `curl --location --request POST 'http://localhost:3000/auth/login' \
   --header 'Authorization: Bearer xxxxxxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxxxxxx' \
   --form 'email="test@test.com"' \
   --form 'password="123123"'`

3. To fetch any of the **jobs** CRUD operation here is an example:

   `curl --location --request GET 'http://localhost:3000/api/v1/jobs' \
   --header 'Authorization: Bearer xxxxxxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxxxxxx'
   `

4. To fetch any of the **job_applications** CRUD operation here is an example:
   `curl --location --request GET 'http://localhost:3000/api/v1/job_application?id=2' \
   --header 'Authorization: Bearer xxxxxxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxxxxxx'`

also note that if the logged in user is an `admin` then the status of the application will be changed to **`TRUE`**.

5. to be continued``... 