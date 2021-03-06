class Api::V1::NewsController < Api::V1::BaseController
  before_filter :auth_only!, except: [:index, :show]
  before_filter :find_news, except: [:index, :create, :new]

  def create

    return missing_params unless params[:title]

    @news = current_user.news.build params[:news]
    if @news.save
      render :json => @news
    else
      render :new, :alert => t(:'news.failed')
    end

  end

  def vote
    @news.update_attributes(:points=> @news.points+1)

    render :nothing => true
  end

  private

  def missing_params
    warden.custom_failure!
    return render json: {}, status: 400
  end

  def find_news
    @news = News.find_by_id(params[:id])

    unless @news
      render :text => "Not Found", :status => 404 and return
    end
  end
end
