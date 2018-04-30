Rails.application.routes.draw do
    get 'courses/:course_id/files/:file_id/static' => 'canvas_file_links#show'
end
