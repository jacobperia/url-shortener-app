class CreateIpAddressUser < ActiveRecord::Migration[6.1]
  def change
    create_table :ip_address_users do |t|
      t.references :url_link
      t.integer :number_of_visits
      t.string :ip_address
      t.index :ip_address

      t.timestamps
    end
  end
end
