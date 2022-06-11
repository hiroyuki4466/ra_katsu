class CreateMains < ActiveRecord::Migration[6.1]
  def change
    create_table :mains do |t|

      t.timestamps
    end
  end
end
