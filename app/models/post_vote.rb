class PostVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  # def post_vote_score
  #   score = PostVote.find_by(self.post_id
  # end
end
