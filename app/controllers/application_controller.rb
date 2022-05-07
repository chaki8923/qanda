class ApplicationController < ActionController::Base
  def appropriate_flash
    case
    when request.format.turbo_stream?
      flash.now
    else
      flash
    end
  end
end
