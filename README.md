# Rails Test Readme

This repository contains my submission for the Rails test assigned on May 16. While I was able to complete most of the test within the provided timeframe, there are a few aspects that require attention.

## Task Completion Status

- **Rails Implementation**: The main functionality of the Rails application has been implemented according to the provided requirements. This is an api based project having devise for authentication and feature to add content with the CRUD operation on it.
- **RSpec Tests**: The majority of the RSpec tests have been completed. However, there are some issues with JWT authentication that need to be addressed.

## Instructions for Running the Application

1. Clone this repository to your local machine:

   ```
   git clone <git@github.com:GithubDjk/backend_test_app.git>
   ```

2. Install dependencies:

   ```
   bundle install
   ```

3. Setup the database:

   ```
   rails db:create
   rails db:migrate
   ```

4. Run the Rails server:

   ```
   rails s
   ```

5. Access the application in your browser at `http://localhost:3000`.

## Testing

To run the RSpec tests, execute the following command:

```
rspec
```

## Issues Encountered

- **Docker Implementation**: Docker implementation could not be completed within the provided time frame. However, I am experienced with Docker and can implement it if required.
- **RSpec Tests**: There are issues with JWT authentication in the RSpec tests that need to be resolved other than that i had added rspec test for the model and controller.

## Additional Notes

- I have experience working with Docker in my current project and can implement it if necessary.
- I am actively working on resolving the issues with JWT authentication in the RSpec tests and will update the repository accordingly.

Please feel free to reach out if you have any questions or need further clarification. Thank you for your understanding.
