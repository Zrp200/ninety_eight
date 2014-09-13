describe "test" do
	context "when $value = 98" do
		$value = 98 
		value = nil
		context "and card = Card.new \"King\"" do
			it "should == 98" {expect(test(value, Card.new("King"))).to eq 98}
		end
	end
end
