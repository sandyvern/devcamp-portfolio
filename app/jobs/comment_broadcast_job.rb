class CommentBroadcastJob < ApplicationJob
  queue_as :default
  
  def perform(comment)
    ActionCable.server.broadcast "blogs_#{blog.comment.id}_channel", comment: render_comment(comment)
  end
  
  private
  def render_comment
    CommentsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end