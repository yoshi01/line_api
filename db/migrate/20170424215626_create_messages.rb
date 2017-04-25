class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :from
      t.integer :to
      t.string :text

      t.timestamps
    end
  end
end
