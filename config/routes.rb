Rails.application.routes.draw do



  # Routes for the Park resource:

  # CREATE
  post("/insert_park", { :controller => "parks", :action => "create" })
          
  # READ
  get("/parks", { :controller => "parks", :action => "index" })
  
  get("/parks/:path_id", { :controller => "parks", :action => "show" })
  
  # UPDATE
  
  post("/modify_park/:path_id", { :controller => "parks", :action => "update" })
  
  # DELETE
  get("/delete_park/:path_id", { :controller => "parks", :action => "destroy" })

  #------------------------------

end
