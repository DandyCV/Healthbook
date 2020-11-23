class TimeSlotValidator < ActiveModel::Validator

  MIN_LENGTH = 5
  MAX_LENGTH = 30

  def validate(record)
    @start_time = record.start_time
    @end_time = record.end_time
    @errors = record.errors
    @doctor = Doctor.find_by_id(record.doctor_id)
    time_slot_length_is_valid
    time_is_divided_by_min_length
    time_slot_not_in_past
    time_slot_not_out_of_work_time
  end

  def time_slot_length_is_valid
    if (@end_time - @start_time).to_i < MIN_LENGTH * 60 || (@end_time - @start_time).to_i > MAX_LENGTH * 60
      @errors.add(:end_time, "should match time slot length from #{MIN_LENGTH} to #{MAX_LENGTH} minutes")
    end
  end

  def time_is_divided_by_min_length
    if @start_time.to_i % (MIN_LENGTH * 60) != 0
      @errors.add(:start_time, "available with step #{MIN_LENGTH} minutes")
    end
    if @end_time.to_i % (MIN_LENGTH * 60) != 0
      @errors.add(:end_time, "available with step #{MIN_LENGTH} minutes")
    end
  end

  def time_slot_not_in_past
    if (@start_time - Time.zone.now).to_i <= 0
      @errors.add(:start_time, "should be not in past")
    end
  end

  def time_slot_not_out_of_work_time
    doctor_start = Time.zone.parse(@doctor.work_hours[0..4])
    doctor_end = Time.zone.parse(@doctor.work_hours[8..-1])
    if doctor_start.hour > @start_time.hour
      @errors.add(:start_time, "should be not earlier #{Time.zone.at(doctor_start).strftime "%H:%M".to_s}")
    elsif doctor_end.hour <= @end_time.hour
      unless doctor_end.hour == @end_time.hour && doctor_end.min == @end_time.min
        @errors.add(:end_time, "should be not later #{Time.zone.at(doctor_end).strftime "%H:%M".to_s}")
      end
    end
  end
end