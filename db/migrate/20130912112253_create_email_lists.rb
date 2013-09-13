class CreateEmailLists < ActiveRecord::Migration
  def change
    create_table :email_lists do |t|
      t.string :email_id
      t.integer :survey_id

      t.timestamps
    end
  end
end
