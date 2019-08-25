class CreateRosters < ActiveRecord::Migration[5.2]
  def change
    create_table :rosters do |t|
      t.string :name
      t.string :extra_attributes, array: true

      t.timestamps
    end

    add_index :rosters, :extra_attributes, using: 'gin'
  end
end
