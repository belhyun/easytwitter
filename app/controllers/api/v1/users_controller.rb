module Api
  module V1
    class UsersController < ApplicationController
      include JsonHelper
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def follow
        fId = params[:f_id] unless params[:f_id].blank?   
        if fId.blank?
          render :json => JsonHelper.res_fail('fId is missing') 
        else
          if @client.follow(fId.to_i)
            render :json => JsonHelper.res_success
          else
            render :json => JsonHelper.res_fail('fail')
          end
        end
      end
    end
  end
end
