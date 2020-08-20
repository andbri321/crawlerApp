class ApplicationController < ActionController::API
    before_action :authenticate
       
    def logged_in?
      !!current_user
    end
  
    def current_user      
      if auth_present? && auth
        user = User.find(auth['user'])
        if user
          @current_user ||= user
        end
      end
    end
  
    def authenticate
      render json: { error: 'unauthorized' }, status: :unauthorized unless logged_in?
    end
    
    def pagination(object)
      {
        current_page: object.current_page,
        next_page: object.next_page,
        prev_page: object.prev_page,
        total_pages: object.total_pages,
        total_count: object.total_count
      }
    end
    
    private
  
    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
    end
  
    def auth
      Auth.decode(token)
    end
  
    def auth_present?
      logger.info "This is from info **************    auth_present  "

      !!request.env.fetch("HTTP_AUTHORIZATION",
        "").scan(/Bearer/).flatten.first
    end
end