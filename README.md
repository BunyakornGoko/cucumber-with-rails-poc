## Cucumber End-to-End Tests

This project includes end-to-end tests written with Cucumber.

### Running the Tests

You can run the Cucumber tests using the provided Makefile. Open your terminal in the project root directory and run:

```bash
make cucumber
```

This command actually executes:

```bash
bundle exec cucumber features/product_management.feature
```

You can view the code in those files by opening them directly in your code editor.
Would you like me to read the content of these files for you using my tools? I can show you the contents of "features/step_definitions/product_steps.rb" and "features/product_management.feature" .

Make sure you have the necessary dependencies installed by running `bundle install` before running the tests.
