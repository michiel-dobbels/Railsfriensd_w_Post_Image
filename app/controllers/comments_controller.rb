
    class CommentsController < ApplicationController
        before_action :authenticate_user!
      
        def create
          @post = Post.find(params[:post_id])
          @comment = @post.comments.build(comment_params)
          @comment.user = current_user
          if @comment.save
            redirect_to post_path(@post), notice: "Comment added!"
          else
            redirect_to post_path(@post), alert: "Comment could not be saved."
          end
        end
      
        def destroy
          @comment = Comment.find(params[:id])
          if @comment.user == current_user
            @comment.destroy
            redirect_to post_path(@comment.post), notice: "Comment deleted."
          else
            redirect_to post_path(@comment.post), alert: "You can only delete your own comments."
          end
        end
        
      
        private
      
        def comment_params
          params.require(:comment).permit(:content)
        end
      end
      

