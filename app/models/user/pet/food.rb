class User::Pet::Food < ApplicationRecord
  belongs_to :food, class_name: '::Pets::Food'
  belongs_to :pet, class_name: '::User::Pet'
end
