class AddEventsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :theme
      t.timestamps
    end
  end
end
