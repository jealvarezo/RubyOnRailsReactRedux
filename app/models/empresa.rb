class Empresa < ApplicationRecord
    has_one :politica, dependent: :destroy
end
