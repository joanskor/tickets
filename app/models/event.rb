class Event < ApplicationRecord
    validate :event_date_not_from_past, :event_price_low_below_high
    validates :artist, :presence => true
    validates :price_low, :presence => true, numericality: true
    validates :price_high, :presence => true, numericality: true
    validates :event_date, :presence => true
    has_many :tickets

    def event_date_not_from_past
        if event_date < Date.today
            errors.add('Data wydarzenia', 'nie może być z przeszłości')
        end
    end

    def event_price_low_below_high
        if price_low > price_high
            errors.add('Cena maksymalna', 'nie może być niższa niż minimalna')
        end
    end
end
