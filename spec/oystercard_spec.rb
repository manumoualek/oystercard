require "/Users/Student/Projects/oystercard/lib/oystercard.rb"

describe Oystercard do
  
  describe "#initialize" do
    it "initalizes with a balance of 0" do
      expect(subject.balance).to eql 0
    end
  end

  describe "#top_up" do
    it "tops up card with amount requested/passed in as argument" do
      expect {subject.top_up 5 }.to change {subject.balance}.by 5
    end

    it "throws an error when top up takes balance over 90" do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect{subject.top_up(1)}.to raise_error("Can't top up balance over 90")
    end  
  end

  describe "#deduct" do 
    it 'deducts value spent from the balance' do 
      expect { subject.deduct 10 }.to change {subject.balance}.by -10
    end

  end
end