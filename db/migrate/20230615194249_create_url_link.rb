class CreateUrlLink < ActiveRecord::Migration[6.1]
  def change
    create_table :url_links do |t|
      t.string :original_url

      t.timestamps
    end
  end
end
