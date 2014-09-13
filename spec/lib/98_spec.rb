describe "test" do
	context "when $value = 98" do
		$value = 98 
		value = nil
		context "and card = Card.new \"King\"" do
			subject {test(value, Card.new("King"))}
			it "should == 98" do
				expect(test(subject).to eq 98
			end
		end
	end
end
