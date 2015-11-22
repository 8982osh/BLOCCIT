describe Vote do
  describe "validations" do
    
    before do
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end
    
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @post.votes ).to eq(-1) or eq(1)
      end
    end
  end
end