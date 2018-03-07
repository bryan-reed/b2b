class StaticPagesController < ApplicationController
  def home
    render layout: 'marketing/marketing'
  end
end
