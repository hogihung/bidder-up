# README

This project should not be used in a production environment.  It has been created
to support a meetup/conference talk - "Tune Up Your Ruby App"

The Ruby based, with Rails framework, app included is for demonstration purposes 
only.  It is a very contrived example - there are no tests included, and some of
code would be considered a 'hack' to just help illustrate the examples.


You will need the following to use this repo:

  * Ruby 2.4.x  
  
  * Rails 5.x
  
  * Bundler to install the required gems used in this project
  
  * qcachegrind/kcachegrind 
  
  * graphviz (used with Ruby Prof and qcachegrind)


# Setup

Clone the repo to your local development computer:

```
cd /path/to/your/projects
git clone https://github.com/hogihung/bidder-up.git
cd bidder-up

bundle install

rake db:migrate

rake dev:setup   # this step will prime the database with sample data used for the demo.

rails s

Visit the app website using your browser at: http://localhost:3000/
```




