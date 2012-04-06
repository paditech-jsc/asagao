class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :member_number
      t.boolean :player
      t.string  :family_name
      t.string  :given_name
      t.string  :furigana
      t.string  :email
      t.string  :phone
      t.integer :sex
      t.date  :birthday
      t.text  :remarks
      t.timestamps
    end
    add_column  :members, :position,  :integer
  end

  def self.down
    drop_table  :members
    remove_column :members, :position
  end
end

