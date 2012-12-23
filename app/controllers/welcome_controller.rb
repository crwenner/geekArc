class WelcomeController < ApplicationController
  def index
  	#limits the number of posts to 10 blogs posts showing
    @posts = Post.unscoped.all(:select => [:id, :date, :title, :content], :order => "updated_at DESC").first(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end
