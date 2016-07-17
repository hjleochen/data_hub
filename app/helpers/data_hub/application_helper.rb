module DataHub
  module ApplicationHelper
		def title(page_title)
			content_for(:title) { page_title }
		end
    def breadcrumbs links = []
      render partial: "layouts/data_hub/breadcrumbs", locals: {links: links}
    end
  end
end
