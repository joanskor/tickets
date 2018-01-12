class Event < ApplicationRecord
    validate :event_date_not_from_past, :event_price_low_below_high, :ticket_amount_not_minus
    validates :artist, :presence => true
    validates :price_low, :presence => true, numericality: true
    validates :price_high, :presence => true, numericality: true
    validates :event_date, :presence => true
    validates :ticket_amout, :presence => true, numericality: true
    validates :age_limit, :presence => true, numericality: true
    has_many :tickets

    def event_date_not_from_past
        if event_date && event_date < Date.today
            errors.add('Data wydarzenia', 'nie może być z przeszłości')
        end
    end

    def event_price_low_below_high
        if price_low && price_high && price_low > price_high
            errors.add('Cena maksymalna', 'nie może być niższa niż minimalna')
        end
    end

    def prices_not_minus
        if price_low && price_high && (price_low <= 0 || price_high <= 0)
            errors.add('Cena wydarzenia', 'musi być większa od zera')
        end
    end

    def ticket_amount_not_minus
        if ticket_amout && ticket_amout <= 0 
            errors.add('Liczba miejsc', 'musi być większa od zera')
        end
    end
end
