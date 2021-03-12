# KJ's List

### About this application

The intent of this application is for user's to connect for gig jobs. A user can post a job they need done, and another user can respond to that posting with a bid, similar to how job's are bidded out to private contractors for contracts with government or large corporations. Rather than relying on word of mouth advertising and networking, which can be expensive for small contractors and gig workers, this application would serve as a forum to connect such workers to jobs. Similar to Craigslist, anyone could post jobs in an open forum. It differs however in that the responses are direct bids on the job, cutting out a lot of back and forth and saving time for both parties involved.

### Installation

Clone this repostiory into your directory.

Navigate to the new directory then execute:
```
$ bundle install
```
Make sure to run both of the following commands
```
$ rake db:migrate

$ rake db:seed
```
From there you can run the app by executing the shotgun command and serving on port :3000
```
$ rails s
```

### Using this application

The seed file contains 4 users to login with (Leo, Ralph, Mikey, and Donnie) each with the password "password". Each are already seeded with data for all models belonging to each user in order to provide a better demo of this app. New users can also create new users of their own through the 'signup' feature to 'login' with or login with their github account through omniauth. 

If not logged in, only an index view of all listings is available and the show view for each listing can be accessed. From the listings index, listings may be queried from the search bar as well.

Once logged in several more feature become availale to the user. The user can create a new listing, view all of their own listings, place bids on other users listings, view bids they have themselves made, or view bids made by other users on the listings that they own. On all listings and bids which belong to a user, that user may edit or delete those objects as well.

A user may also view each contractor from the list of contractors under each skill. Once viewing another user, the logged in user may message that user or leave a review for that user. Reviews for each user can be viewed by clicking on their name through the bid show view or through the previously mentioned list of contractors. Each user can view their messages from the Messages tab in the menu bar and selecting the desired conversation.

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kjosenenko/sinatra-project.

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
