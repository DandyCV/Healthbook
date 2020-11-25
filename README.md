# README

This is web application for clinic. Every user can register his own account and has possibility to make an appointment with a doctor.

How to run this application:

* Clone this repository 
  ```test
  $ git clone -b main https://github.com/DandyCV/Healthbook.git
  ``` 

* Make sure that you have installed Ruby 2.6.6
  ```test
  $ ruby -v
  ```

* Make sure that you have installed NodeJS 13.14.0
  ```test
  $ node -v
  ```

* Config access to your MySQL server in file:
  ```test
  healthbook/config/database.yml
  ```

* Now you can run database setup. Run next command from the project directory:
  ```test
  $ rails db:create db:migrate db:seed
  ```

* Lets start our rails server with:
  ```test
  $ rails s
  ```
  
* You can find our application in browse at:
    ```test
    http://localhost:3000/
    ```

* You have created admin account with:
  ```test
  Login: admin@admin
  Password: admin
  ```

* Now you see some users and doctor. Every user can create appointments. Good luck!

