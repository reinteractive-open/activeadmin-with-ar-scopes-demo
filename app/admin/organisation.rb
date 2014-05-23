ActiveAdmin.register Organisation do

  config.filters = false

  sidebar :filters, only: :index do
    render 'admin/organisations/filters'
  end

  controller do

    # Overrides the Ransack search methods and uses default AR scopes
    def apply_filtering(chain)
      Organisation.filtering_scopes.each do |scope|
        puts "scope: #{scope} params: #{filter_params[scope]}"
        chain = chain.filter_by(scope, filter_params[scope]) unless filter_params[scope].blank?
      end
      chain
    end

    def filter_params
      @filter_params = params[:admin_organisations] || {}
    end

  end
end
