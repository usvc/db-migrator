# Example

This directory contains an example migration together with the Makefile + Rakefile.

# Run It

1. Start the Docker Compose file in the root directory.
2. Make sure the image `usvc/db-migrator` is present on your machine and run `make db_migrate`
3. Observe that the table `users` is created in your database

