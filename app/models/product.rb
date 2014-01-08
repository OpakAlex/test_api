class Product < ActiveRecord::Base

  has_many :codes, dependent: :destroy


  def find_code_by_bonuse(bonuse_code)
    raise 'not implemented'
  end

end
