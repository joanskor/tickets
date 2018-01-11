class Ticket < ApplicationRecord
    validate :price_in_range
    validates :name, :presence => true,
        :length => { :minimum => 6 }
    validates :email_address, :presence => true
    validates :price, :presence => true
    validates :phone, :presence => true
    validates :seat_id_seq, :presence => true
    validates :address, :presence => true
    belongs_to :event

    def price_in_range
        if price > event.price_high || price < event.price_low
            errors.add('Cena', 'musi się mieścić w zakresie cenowym wydarzenia')
        end
    end
end
