class User < ApplicationRecord

validates_uniqueness_of :first_name, scope: :last_name
 end
