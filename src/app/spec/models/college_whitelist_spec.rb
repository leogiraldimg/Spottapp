require 'rails_helper'

RSpec.describe CollegeWhitelist, type: :model do
  describe "#consistency " do

    it 'should not have nullable user' do
      @college_whitelist = build(:college_whitelist_pending)
      @college_whitelist.college.save
      expect {@college_whitelist.save}.to raise_exception(ActiveRecord::NotNullViolation)
    end

    it 'should not have nullable college' do
      @college_whitelist = build(:college_whitelist_pending)
      @college_whitelist.user.save
      @college_whitelist.college = nil
      expect(@college_whitelist.save).to eq(false)
    end

    it 'cannot insert the same user for the same college in permissions' do
      @college_whitelist = create(:college_whitelist_pending)
      @college_whitelist2 = @college_whitelist.dup
      expect {@college_whitelist2.save}.to raise_exception(ActiveRecord::RecordNotUnique)
    end
    
    it 'should allow the same user to different colleges in permissions' do
      @college_whitelist = create(:college_whitelist_pending)
      @college_whitelist2 = @college_whitelist.dup
      @college_whitelist2.college = create(:college)
      expect {@college_whitelist2.save}.to_not raise_error
    end

    it 'should allow different users to same college in permissions' do
      @college_whitelist = create(:college_whitelist_pending)
      @college_whitelist2 = @college_whitelist.dup
      @college_whitelist2.user = create(:user, email: "teste002.user@spottapp.com.br", nickname: "teste002.user")
      expect {@college_whitelist2.save}.to_not raise_error
    end
  end
end
