class Editor::BaseController < ApplicationController
  before_filter :authenticate_editor!
end
