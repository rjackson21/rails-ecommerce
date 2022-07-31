# Rails eCommerce App

This is a Rails e-commerce app, styled after Aritzia's website. 

## Setup
1. Clone this repository
2. `cd` into it 
3. Start the PostgreSQL server (this command may vary depending on how you installed PostgreSQL) brew services start postgresql' and run the migrations `bundle exec rake db:migrate`
4.Install the dependencies by running `bundle`
5. Start the Rails server by running `rails server` in the project root

The ruby version used is 2.7.0 nd rails version 7.0.2 

The application uses PostgreSQL as its database, so this must be installed.

Images are uploaded to Amazon AWS S3, so an account with Amazon is needed (only in production).

Stripel for payments is integrated.


