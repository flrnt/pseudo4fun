class CreatePseudos < ActiveRecord::Migration
  def change
    create_table :pseudos do |t|
      t.string :fake_name
      t.string :real_name
      t.integer :votes, default: 0

      t.timestamps null: false
    end
  end
end
