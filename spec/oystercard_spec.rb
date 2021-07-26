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

  describe "#touch_in" do 
    it 'states whether the user has "touched in" or not.' do 
      subject.top_up(1)
      expect(subject.touch_in).to eql true
    end  

    it 'allows the user to "touch_in" if there is at least £1 balance' do
      subject.top_up(0.5)
      expect{subject.touch_in}.to raise_error("Can't touch in, balance under £1")
    end 
  end

  describe "#touch_out" do 
    it 'states whether the user has "touched out" or not.' do 
      expect(subject.touch_out).to eql false
    end 
  end 

  it 'states if the user is "in journey" or not. ' do  
    expect([true, false]).to include subject.in_journey
  end
 

  

end