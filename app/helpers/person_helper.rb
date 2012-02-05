module PersonHelper
  def timeslot_options(timeslots)
    timeslots.map{|slot|["%2d:%02d" % [slot.to_i/1.hour.to_i ,slot.to_i.modulo(1.hour.to_i)/1.minute.to_i],slot.to_i]}
  end
end
