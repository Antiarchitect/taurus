class Editor::ChargeCardsController < Editor::BaseController
  def index
    charge_card_search = params[:charge_card].to_s.split
    charge_card = ChargeCard.all(:include => [:discipline, :lesson_type, {:teaching_place => [:lecturer, :department]}, :groups])
    charge_card_search.each do |s|
      charge_card = charge_card.select { |c| c.name_for_pair_edit.include? s }
    end
    respond_to do |format|
      format.json { render :json => charge_card.to_json(:only => [:id], :methods => [:name_for_pair_edit])}
    end
  end
end
