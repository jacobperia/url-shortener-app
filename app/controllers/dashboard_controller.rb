class DashboardController < ApplicationController
  before_action :set_token!, only: %i[redirect info]

  def index; end

  def create
    @url_link = UrlLink.new(url_link_params)

    if @url_link.save
      redirect_to info_path(@url_link)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def redirect
    @url_link.increase_use_count!(request.ip)
    redirect_to @url_link.original_url
  end

  def info; end

  private

  def url_link_params
    params.require(:url_link).permit(:original_url)
  end

  def set_token!
    @url_link = UrlLink.find(params[:token])
  end
end
