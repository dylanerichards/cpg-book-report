# README
Find the application live at [cpg-book-report.com](https://www.cpg-book-report.com)

## Starting the Application
- clone the repository and `cd` into it
- install the dependencies by running `bundle`
- run the migrations: `rake db:migrate`
- seed the database: `rake db:seed`
- start the application by running `rails server`

## Running the Tests
- run `RAILS_ENV=test rspec`

## Test Coverage
- After running the tests, to view test coverage metrics, run `open coverage/index.html`
