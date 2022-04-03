class ApplicationController < ActionController::API
  include ActionController::Cookies
  include UserAuthenticate
  include TokenGenerate
end
