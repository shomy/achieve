class CreateQues < ActiveRecord::Migration
  def change
    create_table :ques do |t|
      t.string :name
      t.text :email
      t.text :content

      t.timestamps null: false
    end
  end
end
