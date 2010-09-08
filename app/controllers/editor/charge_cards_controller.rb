class Editor::ChargeCardsController < Editor::BaseController
  def index
    respond_to do |format|
      format.json { render :json => ChargeCard.all.to_json(:only => [:id], :methods => :name_for_pair_edit) }
    end
  end
end
