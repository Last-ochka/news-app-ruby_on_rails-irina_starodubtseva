class AddBelongsToToTasks < ActiveRecord::Migration[6.0]
  def change
    change_table :tasks do |t|
      t.belongs_to :user
    end
  end
end
