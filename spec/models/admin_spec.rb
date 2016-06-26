require 'spec_helper'

describe Admin do
  context "valid Factory" do
		it "has a valid factory" do
			expect(FactoryGirl.build(:admin)).to be_valid
		end
	end

	context "validations" do
		it { should validate_presence_of(:email) }
		it { should validate_confirmation_of(:password) }
		it { should allow_value('example@domain.com').for(:email) }
	end
end
