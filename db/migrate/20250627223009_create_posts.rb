class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string   :title,   null: false
      t.text     :body,    null: false
      t.integer  :price,   null: false
      t.date     :day
      t.boolean  :status,  null: false, default: true
      t.integer  :user_id, null: false

      t.timestamps
    end
  end
end
