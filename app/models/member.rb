class Member < ActiveRecord::Base
  def full_name
    family_name + ''  + given_name
  end
end

