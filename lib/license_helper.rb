module LicenseHelper
  LICENSES = {public_domain: 'No Rights Reserved (Public Domain)',
              cc_by: 'CC BY (Attribution)',
              cc_by_sa: 'CC BY-SA (Attribution ShareAlike)',
              cc_by_nd: 'CC BY-ND (Attribution NoDerivatives)',
              cc_by_nc: 'CC BY-NC (Attribution NonCommercial)',
              cc_by_nc_sa: 'CC BY-NC-SA (Attribution NonCommercial ShareAlike)',
              cc_by_nc_nd: 'CC BY-NC-ND (Attribution NonCommercial NoDerivatives)',
              all_rights_reserved: 'All Rights Reserved'
  }.freeze

  LICENSE_SHORT_HANDS = LICENSES.keys.map(&:to_s).freeze
end