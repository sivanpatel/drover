# Driver insurance is issued to drivers while they rent the vehicle.
# The start date is when the vehicle is picked up and the end date is when the vehicle is dropped off.
# The price of the vehicle is the number of days on cover (excluding the drop off date which is free) -
#   mulitplied by the daily price which is recorded in the associated vehicle (varying by vehicle)
# eg. a rental from 1st Oct to 8th Oct is 7 days, at a rate of £58.50 gives a total of 409.5

# NOTE - The end date may equal the start date of another insurance for the same vehicle (two bookings back to back),
# however you can assume that they will not overlap further than this.

class DriverInsurance < ActiveRecord::Base
  belongs_to :driver, class_name: "Partner"
  belongs_to :vehicle

  def number_of_days_insured
    number_of_hours = (end_date - start_date).to_f * 24
    number_of_hours / 24 # convert to days
  end
end
