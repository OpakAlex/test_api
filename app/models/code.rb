class Code < ActiveRecord::Base

  def code_valid?
    self.status == 'buy'
  end
end
