class ApplicationController < ActionController::Base
  def hello
    render html: "hello, world from wes"
  end
end
