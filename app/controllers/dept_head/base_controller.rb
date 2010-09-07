class DeptHead::BaseController < ApplicationController
  before_filter :authenticate_dept_head!
end
