class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.text :hashed_id, unique: true, index: true, null: false
      t.text :description
      t.text :title
      t.text :areas, array: true, default: [], index: true, null: false
      t.text :address_line_1
      t.text :address_line_2
      t.text :address_city
      t.text :address_county
      t.text :address_postcode
      t.text :contact_name
      t.text :contact_number
      t.text :contact_email
      t.text :contact_url
      t.datetime :published_at, index: true
      t.text :categories, array: true, default: [], index: true, null: false

      t.timestamps
    end
  end
end
