class AddVisitedDateToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :visited_date, :date
  end
end
