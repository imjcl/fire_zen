class ZenController < ApplicationController
  def index
    @zen = ZenServices::get_zen
  end
end