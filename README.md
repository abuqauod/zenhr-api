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

............................

- elastic search enabled and not functional, due to lake of time and knowledge.

### Resource Permission

- Job Seekers are not authorized to manage the Job.`[Done]`
- Admin Users are not authorized to destroy job applications and users.`[Done]`
- You can use either the `cancancan` or `pundit` gems to do this`[Skipped]`


### Data Storage

- All data should be stored in a relational database, use Sqlite `[Done]`

### Users

- Registrations should be done with email and password (Job Seekers) `[Partial Done]`
- There should be one Admin account, which will manage Job Posts `[Done]`
- You should implement the following functionality:`[Done]`
   - User Registration (Job Seekers only)
   - User Login

### Job Post data

- You should implement the following functionality:
   - Job Post must have: title, description `[Done]`
   - Create a new Job Post (Admin) `[Done]`
   - Update or delete existing Job Post (Admin) `[Done]`
   - List all Job Applications (Admin & Job Seeker)`[Done]`

to be continued``... 