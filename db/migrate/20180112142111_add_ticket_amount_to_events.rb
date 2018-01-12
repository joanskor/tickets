class AddTicketAmountToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :ticket_amout, :integer
  end
end
