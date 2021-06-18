class Slack::BaseController < ApplicationController
  # TODO: 社外公開するならちゃんとやる
  protect_from_forgery
end
