# README
## Kinsey's Take Home Assignment

Hello! Thanks for taking the time to review this. Here are a couple things:
* I spent ~3 hours on this end to end as I had other time constraints preventing me from spending more than that. 
* This is a Rails application. You can follow along in the [Rails guides](https://guides.rubyonrails.org/getting_started.html) to get set up if you don't have Rails installed.
* In production, I would use YARD or another standard API documentation tool but for the purposes of this assignment, I am putting the documentation below. 
* Please reach out if you have any questions or want clarification on any specifics. 

## Set Up:
* Once you have Ruby and Rails up and running on your machine you can clone this repository to your local machine.
* Make sure you `cd` into this repository.
* Run `bundle install`.
* Set up and seed the database using `rails db:setup`
* To run the automated tests, run `rspec`
* To run the server, run `rails s`

## Hitting the API Locally:
You can use a curl request, but I prefer [Postman](https://www.postman.com/) or something similar. You can sign up for free. Once you have the Postman application or another API testing platform downloaded, you can make a request following the basic API documentation below. Ensure the server is running before you try to hit the API. 

## API Documentation:
### Creating a Message:
*So you want to create a message in this basic Messenger API?*
Make a POST request with the following: `http://localhost:3000/messages?message_body="Hi Kinsey"&sender_id=11&recipient_id=15`
Because the database is seeded, you can run `rails c` to open a rails console and see what users you have to work with or create your own user in the rails console locally with the following: `User.create!(name: 'NAME HERE')`. Be sure to fill in the message body with a creative message of your choice! Try creating a message with an unknown sender_id and recipient_id to see an appropriate error message. You can go back to the rails console to see that your message was created if you had a correct sender_id, recipient_id and a message body. 

### Getting the Most Recent Messages For a Given Recipient:
*So, you want to get the most recent messages for the given recipient?*
Note that this is not from a specific sender, just for the specific recipient. We will get there next. Make a GET request with the following: `http://localhost:3000/messages/14/recent`
Also, note that our recipient Janice is seeded in the database and her user_id is 14. This will return all of the most recent messages for the recipient_id that you passed in. Although the automated tests cover this, try creating a message that is older than one month old to see that it is not included.

### Getting the Most Recent Messages For a Given Recipient and Given Sender:
*So, you want to get the most recent messages for the given recipient AND the given sender?*
We want to see the messages sent for the given recipient and sender. Make a GET request with the following: `http://localhost:3000/messages/14/recent`
Also, note that our sender Cady is seeded in the database and her user_id is 11. This will return all of the most recent messages for the given sender and recipient. Although the automated tests cover this, try creating a message that is older than one month old to see that it is not included. 

## Future Considerations:
* Better error handling: The error handling in this application is very basic. I would want to make this more bullet proof and add more edge cases to the feature specs. It also does not distinguish from whether the recipient or sender id is invalid when creating a message.
* Refactoring: Look at moving the logic out of the controller and into a service or something else. There is also mild duplication in the messages_controller. Routing is handrolled in parts and could be improved. 
* Database: I am still using the built in SQLite database which would not work in production. I would replace with Postgresql. 
* Authentication: This would 100% be necessary in production. 
* Security Concerns: Ensure ways to prevent SQL injection and other security concerns. 
* Adding more fun features and spending more time on this!
