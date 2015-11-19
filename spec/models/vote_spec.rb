describe Vote do
  describe "validations" do
    describe "value validation" do
      
      describe '#' do
        it "only allows -1 or 1 as values" do
        e  nd
        end
      
     describe '#yes_votes' do
       it "counts the number of yes votes = 1" do
       expect( @post.up_votes ).to eq(1)
       end
     end
      
     describe '#no_votes' do
       it "count the number of no votes = -1" do
       expect( @post.no_votes ).to eq(-1)
     end
    end
  end
end