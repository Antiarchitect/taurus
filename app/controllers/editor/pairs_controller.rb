class Editor::PairsController < Editor::BaseController
  layout nil
  layout 'application', :except => :edit
  
  def create
    @pair = Pair.create do |p|
      p.classroom_id = params[:classroom_id]
      p.day_of_the_week = params[:day_of_the_week]
      p.pair_number = params[:pair_number]
      p.week = params[:week_number]
      p.active_at = Date.today
      p.expired_at = Date.new(2010, 12, 31)
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
    @prev_pair = Car.new(@car.clone_attributes)
    @prev_pair.readonly!
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
      @pair.day_of_the_week = params[:day_of_the_week] if params[:day_of_the_week]
      @pair.pair_number = params[:pair_number] if params[:pair_number]
      @pair.save!
      
      respond_to do |format|
        format.js
      end
    else
      @pair.update_attributes(params[:pair])
      @week = @pair.week
      @day_of_the_week = @pair.day_of_the_week
      @pair_number = @pair.pair_number
      @grid = @pair.classroom_id
      @container = "_grid#{@grid}_week#{@week}_day#{@day_of_the_week}_time#{@pair_number}"

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