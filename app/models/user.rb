class User < ApplicationRecord
    attr_accesssor :name, :email

    def initialize(attributes = {})
        @name = attributes[:name]
        @email = attributes[:email]
    end

    def formatted_email
        "#{@name} <#{@email}"
    end
end
