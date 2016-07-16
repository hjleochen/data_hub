Rails.application.routes.draw do
  mount DataHub::Engine => "/data_hub"
end
