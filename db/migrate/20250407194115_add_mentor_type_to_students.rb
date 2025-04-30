class AddMentorTypeToStudents < ActiveRecord::Migration[6.1]
  def change
    # Only add the reference - this will automatically create the foreign key
    # and index if they don't exist
    add_reference :students, :mentor_type, foreign_key: { to_table: :mentor_types }
    
    # Remove the separate add_index line since add_reference already creates an index
  end
end