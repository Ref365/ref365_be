class WelcomeController < ApplicationController
  def index
    render json: "Hello AWS! -REF365"
  end
end