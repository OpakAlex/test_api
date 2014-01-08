module APIGetway
  extend self

  def status(id)
    return 'buy' if id == '123456'
    false
  end

  def bouse_code(id)
    return '123456' if id == '123456'
    false
  end

end