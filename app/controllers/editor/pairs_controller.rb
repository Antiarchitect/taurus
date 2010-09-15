class Editor::PairsController < Editor::BaseController
  layout nil
  layout 'application', :except => :edit
  
  def create
    @pair = Pair.create do |p|
      p.classroom_id = params[:classroom_id]
      p.day_of_the_week = params[:day_of_the_week]
      p.pair_number = params[:pair_number]
      p.week_number = params[:week_number]
    end
    @container = params[:container]

    respond_to do |format|
      format.js
    end
  end

  def edit
    @pair = Pair.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @pair = Pair.find(params[:id])
    if params[:get_subgroups] && params[:charge_card_id]
      @pair.update_attributes(:charge_card_id => params[:charge_card_id])
      @pair.subgroups.delete_all
      @pair.charge_card.jets.each do |jet|
        @pair.subgroups.create(
          :jet_id => jet.id,
          :number => 0
        )
      end
      redirect_to :action => 'edit'
    elsif params[:classroom]
      Pair.update(params[:id],
        :classroom_id => params[:classroom]
      )
      @pair = Pair.find_by_id(params[:id])
      @pair.week_number = params[:week_number] if params[:week_number]
      @pair.day_of_the_week = params[:day_of_the_week] if params[:day_of_the_week]
      @pair.pair_number = params[:pair_number] if params[:pair_number]
      @pair.save!
      @container = params[:container]

      respond_to do |format|
        format.js
      end
    else
      @pair.update_attributes(params[:pair])
      @container = "container_grid#{@pair.classroom_id}_week#{@pair.week_number}_day#{@pair.day_of_the_week}_time#{@pair.pair_number}"

      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @id = params[:id]
    pair = Pair.find_by_id(@id)
    pair.destroy

    respond_to do |format|
      format.js
    end
  end
end