require 'bookie_wookie'
 
ActionController::Base.send :include, BookieWookie
ActionController::Base.send :helper, BookieWookieHelper
