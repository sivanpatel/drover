# A Partner can be either a Driver or an Owner

class Partner < ActiveRecord::Base
  has_many :driver_insurances, foreign_key: "driver_id"
  has_many :owned_vehicles, class_name: "Vehicle", foreign_key: "owner_id"

  def total_days_charged_for_all_driver_insurance_policies
    total_days_covered = 0
    driver_insurances.each do |insurance_cover|
      total_days_covered += insurance_cover.number_of_days_insured
    end
    total_days_covered
  end

  def self.driver_insurance_price(driver_insurance)
    driver_insurance.number_of_days_insured *
      driver_insurance.vehicle.driver_insurance_daily_rate_pounds
    # this had a hardcoded value for the insurance rate, so now instead taking
    # the value from the vehicle on the insurance
  end

  def total_insurance_price(driver_insurances)
    total_price = 0
    driver_insurances.each do |driver_insurance|
      total_price += Partner.driver_insurance_price(driver_insurance)
    end
    total_price
  end

  def total_vehicle_owner_insurance_v2_charges_pounds; end
end
