require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :cleaning }
    it { is_expected.to have_db_column :shift_preference }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }    
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }    
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:user)).to be_valid
    end
  end
end