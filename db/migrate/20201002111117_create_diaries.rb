class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.datetime :start_time
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
