class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
