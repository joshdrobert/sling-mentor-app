class CreateStudentBoardLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :student_board_leads do |t|
      t.references :user, null: false, foreign_key: true

      t.references :board_lead, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end