class Message < ApplicationRecord
    validates :to,  presence: true
    validates :from,  presence: true
    validates :text,  presence: true, length: { maximum: 50 }

    def self.scope(from, to)
         to_scope(from, to).from_scope(from, to)
    end

    def self.to_scope(from, to)
         where(to: from).or(where(to: to))
    end

    def self.from_scope(from, to)
         where(from: from).or(where(from: to))
    end
     
end
