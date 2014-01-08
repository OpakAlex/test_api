require 'api_getway'

class API::GTA < Product

  def find_code_by_bonuse(bonuse_code)
    code  = self.codes.where(bonuse_code: bonuse_code).first
    return nil unless code
    return code if code.status.present?
    status = ::APIGetway.status(code.bonuse_code)
    code.status = status
    code.save
    code
  end
end