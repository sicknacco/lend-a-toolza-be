class Api::V1::ChatsController < ApplicationController
  
  def show
    project = params[:project]
    chat_service = ChatService.new
    tools = chat_service.get_tools(project)

    render json: { tools: tools }, status: :ok
  end
end