class Api::V1::HealthController < ApplicationController
    def index
        ActiveRecord::Base.connection.execute("select now()")
    end
 end
 