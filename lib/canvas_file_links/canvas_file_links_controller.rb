# Copyright (C) 2018 Atomic Jolt

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Parts of this file have been copied from Instructure's file located at
# https://github.com/instructure/canvas-lms/app/controllers/enrollments_api_controller.rb

require_dependency "app/controllers/application_controller"
require_dependency "lib/api"

class CanvasFileLinksController < ApplicationController

  def show
    if params[:course_id] && params[:file_id]
      file = Attachment.find_by_id(params[:file_id])
      if file.present?
        file_path = Folder.find(file.folder_id).full_name
        file_path += "/#{file.display_name}"
        static_file_route = ""
        static_file_route += "/courses/#{params[:course_id]}/files/#{params[:file_id]}/"
        static_file_route += file_path
        redirect_to static_file_route
        return
      end
    end
    return not_found
  end

  def not_found
    return render 'shared/errors/file_not_found',
      status: :bad_request,
      formats: [:html]
  end

end
