class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      
      t.string :title,       null: false
      t.string :text,        null: false
      t.string :infomation,  null: false
      t.references :admin,   null: false,foreign_key: true
      t.references :customer,null: false,foreign_key: true
      t.timestamps
    end
  end
end
