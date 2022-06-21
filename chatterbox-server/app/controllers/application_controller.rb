class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do 
    messages = Message.all.order(created_at: :asc)
    messages.to_json
  end

  post '/messages' do 
    createMessage = Message.create(
      body: params[:body],
      username: params[:username]
    )
    createMessage.to_json
  end

  patch '/messages/:id' do 
    patchMessage = Message.find(params[:id])
    patchMessage.update(
      body: params[:body]
    )
    patchMessage.to_json
  end

  delete '/messages/:id' do 
    deleteMessage = Message.find(params[:id])
    deleteMessage.destroy
    deleteMessage.to_json
  end

end
