class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :field_id
      t.integer :user_id
      t.text :answer

      t.timestamps
    end

    add_index :feedbacks, :field_id
    add_index :feedbacks, :user_id
  end
end
