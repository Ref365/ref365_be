class WelcomeController < ApplicationController
  def index
    render json: %q{
      Welcome to the REF365 Back-end Application.

      Visit our github page at: https://github.com/Ref365

      View our readme at: https://github.com/Ref365/ref365_be/blob/master/README.md

      Thanks.
      
       - REF365 Team
    }end
end