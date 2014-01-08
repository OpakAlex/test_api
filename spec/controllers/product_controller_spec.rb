require 'spec_helper'

describe ProductController do

  before :each do
    @gta = API::GTA.create!(name: "GTA", description: "GTA game")
    @code = Code.create(bonuse_code: 123456.to_s)
    @gta.codes << @code
  end

  context 'gta' do
    describe '#show' do
      it 'returns 200 if code valid and product exist' do
        responce = get('show', {id: @gta.id, code: @code.bonuse_code})
        responce.status.should == 200
      end

      it 'returns 404 if code invalid or product not exist' do
        responce = get('show', {id: 54054})
        responce.status.should == 404

        responce = get('show', {id: 54054, code: 68321})
        responce.status.should == 404
      end

      it 'returns 401 if product didn\'t buy' do
        @gta.codes << Code.create(bonuse_code: 12345)
        responce = get('show', {id: @gta.id, code: 12345})
        responce.status.should == 401
      end
    end
  end
end