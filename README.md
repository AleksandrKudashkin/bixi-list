# Mr. Bertrand wants to get home using a BIXI bike

A simple app to list nearest BIXI stations with bikes available to take

* Ruby version: 2.3.4

* Rails version: 5.1

* Database: SQLlite

* Dependencies:
  - Geocoder for distance calculation
  - ActiveRecord-Import for faster mass insertion
  - Typhoeus for faster HTTP requests (uses libcurl)

  
* Installation instructions

  - clone `git clone https://github.com/AleksandrKudashkin/bixi-list.git`
  - run `cd bixi-list && bundle install`
  - run `rails db:create && rails db:migrate`
  - run tests `rails test`
  - start server `rails server`
  - Enjoy!
