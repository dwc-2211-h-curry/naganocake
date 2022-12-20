class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name,  null: false, default: ""
      t.references :genre, null: false, foreign_key: true
      t.text :introduction, null: false, default: ""
      #下のカラムは税抜価格
      t.integer :price, null: false, default: ""
      #下のカラムは販売ステータス
      t.boolean :is_active, null: false, default: "TRUE"
      t.timestamps
    end
  end
end
