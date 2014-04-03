require 'spec_helper'

describe Entry do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @entry = user.entries.build(content: "Lorem ipsum") }

  subject { @entry }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:admin) }
  it { should respond_to(:entries) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @entry.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @entry.content = " " }
    it { should_not be_valid }
  end
end