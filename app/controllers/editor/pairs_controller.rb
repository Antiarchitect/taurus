class Editor::PairsController < Editor::BaseController
  layout nil
  layout 'application', :except => :edit
  
  def create
    @pair = Pair.new do |p|
      p.classroom_id = params[:classroom_id]
      p.day_of_the_week = params[:day_of_the_week]
      p.pair_number = params[:pair_number]
      p.week = params[:week_number]
      p.active_at = Date.today
      p.expired_at = Date.new(2010, 12, 31)
    end
    candidates = Pair.find_candidates(@pair)
    if candidates.select { |c| c.week == @pair.week || c.week == 0 }.size > 0 
      @pair = false
    else
      @pair.save
      @container = params[:container]
    end    

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
    @pair = Pair.find_by_id(params[:id].to_i)
    @prev_pair = @pair.clone
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
      @pair = Pair.find_by_id(params[:id].to_i)
      @pair.classroom_id = params[:classroom].to_i    
      @pair.day_of_the_week = params[:day_of_the_week].to_i if params[:day_of_the_week]
      @pair.pair_number = params[:pair_number].to_i if params[:pair_number]
      candidates = Pair.find_candidates(@pair)
      if candidates.size > 0
        if @pair.week == 0 && candidates.select { |c| c.id != @pair.id }.size > 0 
          @pair = Pair.find_by_id(params[:id].to_i)
        elsif @pair.week != 0 && candidates.select { |c| c.id != @pair.id && (c.week == 0 || c.week == @pair.week) }.size > 0
          @pair = Pair.find_by_id(params[:id].to_i)
        else
          @pair.save
        end
      else
        @pair.save
      end      
      
      respond_to do |format|
        format.js
      end
    else
      candidates = Pair.find_candidates(@pair)
      if candidates.size > 0
        if (params[:pair][:week] == "0" && candidates.select { |c| c.week != 0  && c.id != @pair.id }.size > 0) || (params[:pair][:week] == "1" && candidates.select { |c| c.week == 1 && c.id != @pair.id }.size > 0) || (params[:pair][:week] == "2" && candidates.select { |c| c.week == 2 && c.id != @pair.id }.size > 0)
          params[:pair][:week] = @pair.week
        end
      end
      @pair.update_attributes(params[:pair])
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @id = params[:id].to_i
    pair = Pair.find_by_id(@id)
    @pair = pair.clone
    @pair.readonly!
    pair.destroy

    respond_to do |format|
      format.js
    end
  end
end