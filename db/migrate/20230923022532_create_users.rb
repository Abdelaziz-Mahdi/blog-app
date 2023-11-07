class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: "https://ui-avatars.com/api/?name=Df"
      t.text :bio, default: ""
      t.integer :posts_counter, default: 0, null: false

      t.timestamps
    end
  end
end
