class AddBelongsToToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :belongs_to
    t.datetime :published_at
  end
end
