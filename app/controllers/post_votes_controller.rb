class PostVotesController < ApplicationController
  def edit
    # This is a classic underutilization of ActiveRecord
    #
    # Post.find(params[:post_id]).postvotes.create
    #
    # but that makes me ask the question: what's a PostVote?  You could give
    # that a much more informative name like: "Voting" -> "VotingsController"
    #
    # But then again, it also might be much better for there to be a Vote class
    # which has a value (+1 / -1).  Thus we could do:
    #
    # Post.find(:id).votes.map(&:value).reduce(:+)
    post_vote = PostVote.find_by(post_id: params[:post_id])
    old_score = post_vote.score
    post_vote.update(score: old_score+1)
    redirect_to root_path
  end

  def destroy
    post_vote = PostVote.find_by(post_id: params[:post_id])
    old_score = post_vote.score
    post_vote.update(score: old_score-1)
    redirect_to root_path
  end
end
