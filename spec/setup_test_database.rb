require 'pg'

def setup_test_database
  p "setting up the databse ready for testing"
  # connect to the test db
  connection = PG.connect(dbname: "bookmark_manager_test")
  # clear the table
  connection.exec("TRUNCATE bookmarks;")
end
