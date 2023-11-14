class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :memo
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :is_all_day, default: false

      t.timestamps
    end
  end
end
