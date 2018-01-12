class AddAgeLimitToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :age_limit, :integer
  end
end
