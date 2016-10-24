require 'license_helper'

class Chorus < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :context, optional: true

  validates_inclusion_of :license, in: LicenseHelper::LICENSE_SHORT_HANDS

  store_accessor :settings
end
