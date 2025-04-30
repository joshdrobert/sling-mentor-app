class AddFieldsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :student_id, :bigint
    add_column :questions, :mentor_type_id, :bigint
    add_column :questions, :specialty_id, :bigint
    add_column :questions, :comment_count, :integer
  end
end
