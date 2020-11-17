class FreeSlotValidator < ActiveModel::Validator
  #time step (seconds)
  TIME_STEP = 300

  def validate(record)
    doctor_slots = Visit.where(doctor_id: record.doctor_id, start_time: record.start_time..record.start_time.next_day)
    user_slots = Visit.where(user_id: record.user_id, start_time: record.start_time..record.start_time.next_day)
    all_slots = doctor_slots + user_slots
    all_slots.each do |slot|
      # checking reserved time slots
      slot_array = ((slot.start_time.to_i / TIME_STEP)..(slot.end_time.to_i) / TIME_STEP).to_a
      if (slot_array & ((record.start_time.to_i / TIME_STEP)..(record.end_time.to_i / TIME_STEP)).to_a).length > 1
        if slot.id != record.id
        # looking for intersection current timeslot with others
        if record.doctor_id == slot.doctor_id
          record.errors[:base] << 'This time is busy'
          break
        else
          record.errors[:base] << "You have visit to doctor #{slot.doctor.surname} for this time"
          break
        end
        end
      end
    end
  end
end

