class CreateMentorTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :mentor_types do |t|
      t.string :short_name
      t.string :name
      t.timestamps
    end
  end
end