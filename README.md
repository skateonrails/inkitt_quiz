# Quiz

Build a small tool that will do the following:

 - Shows to a user a simple Quiz, that has 5 questions as 5 separate pages, shown one after another. Each question will have 2-5 predefined answers that user can pick from, open answers are not possible. No backend for managing questions is needed.
 - After the quiz user should see the results page with answers distribution for each question from all users who completed the quiz (answered all 5 questions).
 - The user should not be able to access next question without answering current, or going back to previous questions.
 - No login for users should be required.
 - The user should be able to do the quiz only once (We expect that users always use default browser settings and don't use incognito).

## Requirements:
Testwork should be done using ruby framework of your choice.
Any gems are allowed

Quiz should have backend rendering


Please try to make the interface as user-friendly as possible


## Technical Specs
* Ruby version
  * Ruby 2.3.4


* System dependencies
  * run `bundle install`


* Database creation
  * run `rake db:create`


* Database initialization
  * use `rake db:seed` or `rake db:setup`


* How to run the test suite
  * use `bundle exec rspec`
