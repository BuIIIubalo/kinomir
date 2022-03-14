class NewsController < ApplicationController
  def index
    @news = New.order(created_at: :desc)
  end
end