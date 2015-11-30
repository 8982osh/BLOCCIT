<<<<<<< HEAD
describe Vote do
  describe "validations" do
    
    before do
      @post = Post.create(title: 'post title', body: 'post body')
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end
    
    describe 'up_votes' do
      it "counts the number of yes votes" do
        expect( @post.up_votes ).to eq(3) 
      end
    end
    
    describe 'down_votes' do
      it "counts the number of down votes" do
        expect( @post.down_votes ).to eq(2) 
      end
    end
    
    describe 'counts' do
      it "counts the total num of votes" do
        expect( @post.points ).to eq(1)
      end
    end
  end
=======
require 'rails_helper'

RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> checkpoint-49a-voting
end
