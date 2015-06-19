class PostVotesController < ApplicationController
  def edit
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
