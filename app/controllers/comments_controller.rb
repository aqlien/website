class CommentsController < ApplicationController
  before_filter :find_source, except: [:index]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @commentable, notice: 'Your comment is pending approval.'}
        format.js { }
        @commentable.comments << @comment
      else
        instance_variable_set("@#{@parent_type.singularize}".to_sym, @commentable)
        format.html {render @commentable, notice: 'There was a problem saving your comment.'}
        format.js { }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(:approved=>params[:approved])
        format.html {redirect_to @commentable, notice: 'Comment has been approved.'}
        format.js { }
      else
        format.html {redirect_to @commentable, notice: 'There was a problem updating this comment.'}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @commentable, notice: 'Comment has been deleted.'}
      format.js { }
    end
  end

private
  def comment_params
    params.require(:comment).permit(:content, :author, :author_id,
      :author_email, :user_agent, :user_ip, :referrer, :approved)
  end

  def find_source
    @parent_type, parent_id = request.path.split('/')[1..2]
    @commentable = @parent_type.singularize.classify.constantize.find(parent_id)
  end
end
