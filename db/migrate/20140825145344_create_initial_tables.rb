class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :people do |p|
      p.string :name
      p.decimal :latitude
      p.decimal :longitude
    end
    
    create_table :parks do |p|
      p.string :name
      p.string :address
      p.decimal :latitude
      p.decimal :longitude
      p.text :pdf_map
      p.string :park_url
    end
    
    create_table :parks_people do |p|
      p.integer :park_id
      p.integer :person_id
    end
    
    create_table :stories do |s|
      s.integer :person_id
      s.integer :park_id
      s.text :story
    end
    
  end
end
