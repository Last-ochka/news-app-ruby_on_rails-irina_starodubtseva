class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :text
      t.boolean :status, default: 0

      t.timestamps
    end
  end
end
