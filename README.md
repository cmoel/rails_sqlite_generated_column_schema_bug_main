# Rails SQLite Generated Column Schema Bug

This minimal Rails application outlines a bug when generating `db/schema.rb`
and with virtual/generated columns. This is based on Rails `main` branch on
2024-04-07.

## The issue

1. Create a table (`syncs` in this example).
2. Add a virtual column to the table using a newly generated migration.
3. `bin/rails db:migrate` to migrate the DB and update `db/schema.rb`. At this
   point `db/schema.rb` is correct.
4. `bin/rails db:prepare`. This changes the virtual column in `db/schema.rb`,
   making it as a `boolean` column, not a `virtual type: :boolean` column.
