class AddPaymentStatusToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :payment_status, :boolean, default: false
  end
end
