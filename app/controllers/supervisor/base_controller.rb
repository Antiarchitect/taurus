class Supervisor::BaseController < ApplicationController
  before_filter :authenticate_supervisor!
end
