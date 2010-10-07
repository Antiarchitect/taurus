class Editor::PairsController < Editor::BaseController
  layout nil
  layout 'application', :except => :edit

  def create
    @pair = Pair.new do |p|
      p.classroom_id = params[:classroom_id]
      p.day_of_the_week = params[:day_of_the_week]
      p.pair_number = params[:pair_number]
      p.week = params[:week]
      p.active_at = Date.today
      p.expired_at = Date.new(2010, 12, 31)
    end
    @container = params[:container]
    unless @pair.valid?
      flash[:error] = @pair.errors[:base].to_a.join('<br />').html_safe
      @pair = nil
    else
      @pair.save
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
    @pair = Pair.find_by_id(params[:id].to_i, :include => [:subgroups])
    @prev_pair = @pair.clone
    @prev_pair.readonly!
    if params[:get_subgroups] && params[:pair]
      @pair.attributes = params[:pair]
      unless @pair.valid?
        flash[:error] = @pair.errors[:base].to_a.join('<br />').html_safe
        @pair = @prev_pair
      else
        @pair.save
        logger.info("sub1: #{@pair.subgroups.count}")
        @pair.subgroups.delete_all
        logger.info("sub2: #{@pair.subgroups.count}")
        logger.info("jets: #{@pair.charge_card.jets}")
        @pair.charge_card.jets.each do |jet|
          subgroup = @pair.subgroups.new(:jet_id => jet.id, :number => 0)
          unless subgroup.valid?
            flash[:error] = subgroup.errors[:base].to_a.join('<br />').html_safe
          else
            subgroup.save
          end
        end
        redirect_to :action => 'edit'
      end
    elsif params[:classroom]
      @pair.classroom_id = params[:classroom].to_i
      @pair.day_of_the_week = params[:day_of_the_week].to_i if params[:day_of_the_week]
      @pair.week = params[:week].to_i if params[:week]
      @pair.pair_number = params[:pair_number].to_i if params[:pair_number]
      unless @pair.valid?
        flash[:error] = @pair.errors[:base].to_a.join('<br />').html_safe
        @pair = @prev_pair
      else
        @pair.save
      end

      respond_to do |format|
        format.js
      end
    else
      @pair.attributes = params[:pair]
      unless @pair.valid?
        flash[:error] = @pair.errors[:base].to_a.join('<br />').html_safe
        @pair = @prev_pair
      else
        @pair.save
      end
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