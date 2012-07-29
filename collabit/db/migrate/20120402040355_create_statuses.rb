class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :last_edited_by
      t.string :status
      t.string :week_ending
      t.string :title
      t.integer :team_number
      t.boolean :reviewed
      t.boolean :submitted

      t.timestamps
    end
  end
end
