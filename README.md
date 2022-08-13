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

![](../../Desktop/singup.png)

also please note that you need send the params as **form-data** if you are using postman

you will get a **token** to validate your session

2. then You have to pass the `token` in `Authorization` header with the `login` api request:

   `curl --location --request POST 'http://localhost:3000/auth/login' \
   --header 'Authorization: Bearer xxxxxxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxxxxxx' \
   --form 'email="test@test.com"' \
   --form 'password="123123"'`

![](../../Desktop/login.png)


3. To fetch any of the **jobs** CRUD operation here is an example:

   `curl --location --request GET 'http://localhost:3000/api/v1/jobs' \
   --header 'Authorization: Bearer xxxxxxxxxxxxxxxxx.xxxxxxxxxxxx.xxxxxxxxxxxxx'
   `

![](../../Desktop/list of jobs.png)


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

- You should implement the following functionality: **`follow Point #3`**
    - Job Post must have: title, description `[Done]`
    - Create a new Job Post (Admin) `[Done]`
    - Update or delete existing Job Post (Admin) `[Done]`
    - List all Job Applications (Admin & Job Seeker) `[Done]` **`follow Point #4`**

### Job Applications

- You should implement the following functionality: **`follow Point #4`**
    - Job seekers apply to any job by creating a Job Application that will have a status of (Not Seen) by
      default `[Done] | no realations was created, ensured or validated while creating the request`
    - When an Admin User views a Job Application this will change their status to (Seen) `[Done]`

### Test / Rspec

- Your code should be tested using Rspec  `[Not Done] due to got a problem with` ` rails generate rspec:install`
    - Models
    - Controllers

### Bonus task (NOT mandatory)

- Allow Users to add resumes and send them to be stored on AWS S3
- Send emails to the user (Job Seeker) once the application is seen (You can use MailTrap for this) `[Done]`
- Implement a search for Jobs by title or creation date `[Done]`
- Add the Expiry date to the job post so it won't appear to the job seeker after a specific date`[Done]`
- Use ElasticSearch to search for keywords in the Job Description `[implmeneted but not functional]`
- Implement a simple client using a frontend framework of your choice that consumes your API
- Implement CI using Travis and use Coverall for code coverage and insert their badges into your readme file.